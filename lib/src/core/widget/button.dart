import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/styles/app_colors.dart';

Widget customButton(String title, VoidCallback onPressed) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: TextStyle(fontSize: 14.sp, color: Colors.white),
    ),
    style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        padding: MaterialStateProperty.all(EdgeInsets.all(15.w)),
        backgroundColor:
            MaterialStateProperty.all(AppColors.current.secondaryColor)),
  );
}
