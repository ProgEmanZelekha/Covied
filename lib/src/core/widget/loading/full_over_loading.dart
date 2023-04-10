import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/colors.dart';

class FullOverLoading extends StatelessWidget {
  const FullOverLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: witheTransparent4,
        ),
        Lottie.asset(Assets.loading, fit: BoxFit.fill, height: 120, width: 120),
      ],
    );
  }
}
