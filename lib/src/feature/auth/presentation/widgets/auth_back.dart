import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';

class AuthBack extends StatelessWidget {
  final Widget body;
  final String title;
  bool? hasBack = false;

  AuthBack({Key? key, required this.body, required this.title, this.hasBack})
      : super(key: key);
  final double radius = 90;
  final double radiusAuth = 30;
  final double paddingMainAuth = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.current.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius)),
              ),
              height: (ScreenUtil.defaultSize.height * .4),
            ),
            InkWell(
              onTap: () {
                context.router.pop();
              },
              child: Visibility(
                  visible: hasBack ?? false,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).viewPadding.top,
                        right: 8.w,
                        left: 8.w),
                    child: SvgPicture.asset(
                      Assets.images.back,
                      height: 30.w,
                      width: 30.w,
                    ),
                  )),
            ),
            bottomBody()
          ],
        ),
      ),
    );
  }

  Widget bottomBody() {
    return Padding(
      padding: EdgeInsets.only(top: (ScreenUtil.defaultSize.height * .15)),
      child: Column(
        children: [
          Text(
            title,
            style: whiteText22,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(radiusAuth))),
              padding: EdgeInsets.all(paddingMainAuth),
              margin: EdgeInsets.all(paddingMainAuth),
              child: body)
        ],
      ),
    );
  }
}
