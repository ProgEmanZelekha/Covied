import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/app/bloc/app_bloc.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_cubit.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/feature/home/presentation/widgets/corners_back.dart';
import 'package:untitled/src/feature/home/presentation/widgets/item_select_widget.dart';
import 'package:untitled/src/generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            CornersBack(
                height: .2,
                radius: 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.current.primaryTextColor,
                      radius: 30.w,
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
                    Text(
                      "${S.current.hello} ${BlocProvider.of<AppBloc>(context).name}",
                      style: whiteText12,
                    )
                  ],
                )),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                bloc.emit(ChangeActive(1));
              },
              child: ItemSelectWidget(
                text: S.current.home_select_1,
                image: Assets.images.home1.path,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ItemSelectWidget(
              text: S.current.home_select_2,
              image: Assets.images.home2.path,
            ),
            SizedBox(
              height: 10.h,
            ),
            ItemSelectWidget(
              text: S.current.home_select_3,
              image: Assets.images.home3.path,
            ),
          ],
        );
      },
    );
  }
}
