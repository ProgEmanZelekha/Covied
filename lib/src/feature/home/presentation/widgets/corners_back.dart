import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/styles/app_colors.dart';

class CornersBack extends StatelessWidget {
  const CornersBack({Key? key, required this.child, this.radius, this.height})
      : super(key: key);
  final double? radius;
  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.current.primaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius??90),
            bottomRight: Radius.circular(radius??90)),
      ),
      height: (ScreenUtil.defaultSize.height * (height??.3)),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: child,
    );
  }
}
