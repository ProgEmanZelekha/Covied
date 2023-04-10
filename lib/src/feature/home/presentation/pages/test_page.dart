import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/feature/home/presentation/widgets/corners_back.dart';
import 'package:untitled/src/feature/home/presentation/widgets/item_select_widget.dart';
import 'package:untitled/src/generated/l10n.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        children: [
          CornersBack(
              height: .3,
              radius: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.images.home1.path,
                    width: 100.w,
                    height: 100.w,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    S.current.test_title,
                    style: whiteText16,
                    textAlign: TextAlign.center,
                  )
                ],
              )),
          SizedBox(
            height: 30.h,
          ),
          InkWell(
            onTap: (){context.router.push(QuestionRoute());},
            child: ItemSelectWidget(
              text: S.current.test_select_1,
              imageSize: 80.w,
              image: Assets.images.test1,
              isSvg: true,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ItemSelectWidget(
            text: S.current.test_select_2,
            imageSize: 80.w,
            image: Assets.images.test2,
            isSvg: true,
          ),
          SizedBox(
            height: 10.h,
          ),
          ItemSelectWidget(
            text: S.current.test_select_3,
            imageSize: 80.w,
          ),

        ]);
  }
}
