import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';

class AppBarBack extends StatelessWidget {
  AppBarBack({Key? key, required this.title, this.big}) : super(key: key);
  final String title;
  bool? big = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.current.primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.w),
                bottomRight: Radius.circular(20.w)),
          ),
          height: big ?? true
              ? (ScreenUtil.defaultSize.height * .4)
              : (ScreenUtil.defaultSize.height * .15),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top + 8.w,
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              children: [
                Text(
                  title,
                  style: whiteText22,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Visibility(
                  visible: big ?? true,
                  child: Center(
                      child: Image.asset(
                    Assets.images.profileHome.path,
                    width: 180.w,
                    height: 180.w,
                  )),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            context.router.pop();
          },
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top + 8.w,
                right: 10.w,
                left: 10.w),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
