import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';

class ItemSelectWidget extends StatelessWidget {
  final String? image;
  final String text;
  final double? imageSize;
  final bool? isSvg;

  const ItemSelectWidget(
      {Key? key, required this.text, this.image, this.imageSize, this.isSvg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.w)),
        color: AppColors.current.primaryColor,
      ),
      padding: EdgeInsets.all(10.w),
      child: Row(
        children: [
          Expanded(
              child: Text(
            text,
            textAlign: TextAlign.center,
            style: whiteText20,
          )),
          (image != null)
              ? (isSvg ?? false)
                  ? SvgPicture.asset(
                      image ?? "",
                      width: imageSize ?? 130.w,
                      height: imageSize ?? 130.w,
                    )
                  : Image.asset(
                      image ?? "",
                      width: imageSize ?? 130.w,
                      height: imageSize ?? 130.w,
                    )
              : const SizedBox(),
        ],
      ),
    );
  }
}
