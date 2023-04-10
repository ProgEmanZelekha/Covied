import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/src/app/bloc/app_bloc.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/feature/home/presentation/widgets/item_select_profile.dart';
import 'package:untitled/src/generated/l10n.dart';

class ProfileInfoPage extends StatelessWidget {
  const ProfileInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarBack(title: S.current.personal_info),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    BlocProvider.of<AppBloc>(context).name ?? "",
                    style: TextStyle(
                        color: AppColors.current.primaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    BlocProvider.of<AppBloc>(context).email ?? "",
                    style: TextStyle(
                        color: AppColors.current.primaryColor, fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ItemProfileSelect(
              image: Assets.images.settingProfile,
              title: S.current.change_pass,
              padding: 8.w,
              onClick: () {
                context.router.push( ChangePasswordRoute(type: 2));},
            )
,
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                    width: double.infinity,
                    child: customButton(S.current.edit, () {
                      context.router.push(EditeProfileRoute());
                    })),
              ),
            )
          ]),
    );
  }
}
