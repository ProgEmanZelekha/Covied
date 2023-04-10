import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/app/bloc/app_bloc.dart';
import 'package:untitled/src/feature/home/presentation/widgets/corners_back.dart';
import 'package:untitled/src/feature/home/presentation/widgets/item_select_profile.dart';
import 'package:untitled/src/generated/l10n.dart';

import '../../../../core/navigation/routes/AppRouter.gr.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          CornersBack(
              height: .2,
              radius: 30,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.current.primaryTextColor,
                    radius: 50.w,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(
                        Assets.images.profileHome.path,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      "${S.current.hello} ${BlocProvider
                          .of<AppBloc>(context)
                          .name}",
                      style: whiteText16,
                    ),
                  )
                ],
              )),
          SizedBox(
            height: 20.h,
          ),
          ItemProfileSelect(
            image: Assets.images.profileHolder,
            title: S.current.personal_info,
            padding: 8.w,
            onClick: () {context.router.push(const EmptyProfileRoute());},
          ),
          SizedBox(
            height: 10.h,
          ),
          ItemProfileSelect(
            image: Assets.images.settingProfile,
            title: S.current.setting,
            padding: 8.w,
            onClick: () {
              context.router.push(const SettingsRoute());},
          ),
          SizedBox(
            height: 10.h,
          ),
          ItemProfileSelect(
            image: Assets.images.infoProfile,
            title: S.current.about_us,
            padding: 0.w,
            onClick: () {context.router.push(const AboutUsRoute());},
          ),
          SizedBox(
            height: 10.h,
          ),
          ItemProfileSelect(
            image: Assets.images.phoneProfile,
            title: S.current.contact_us,
            padding: 8.w,
            onClick: () {context.router.push(const ContactUsRoute());},
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                width: double.infinity,
                child: logoutButton(context)),
          )
        ]);
  }

  Widget logoutButton(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listenWhen: (ps,cs)=>cs is AppLogin,
      listener: (context, state) {
        if (state is AppLogin && !state.isLogin!) {
          BlocProvider.of<AppBloc>(context).add(const LogoutEvent(isLogin: true));
          context.router.push(const AuthContainer());
          context.router.popUntil((route) => route == AuthContainer());
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            BlocProvider.of<AppBloc>(context).add(const LogoutEvent(isLogin: false));
          },
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
                color: AppColors.current.secondaryTextColor,
                borderRadius: BorderRadius.all(Radius.circular(20.w))),
            child: Row(
              children: [
                SvgPicture.asset(
                  Assets.images.logoutProfile,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  S.current.logout,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
