
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';

class ItemProfileSelect extends StatelessWidget {
  const ItemProfileSelect(
      {Key? key,
      required this.image,
      required this.title,
      required this.onClick,
      required this.padding})
      : super(key: key);
  final String image;
  final String title;
  final GestureTapCallback onClick;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
                color: AppColors.current.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(5.w))),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: SvgPicture.asset(
                image,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
              child: Text(
            title,
            style: TextStyle(
                color: AppColors.current.primaryColor, fontSize: 15.sp),
          )),
          InkWell(
            onTap: onClick,
            child: Image.asset(
              Assets.images.nextProfile1.path,
              color: AppColors.current.primaryColor,
              width: 30.w,
              height: 30.w,
              matchTextDirection: true,
            ),
          ),
        ],
      ),
    );
  }
}
