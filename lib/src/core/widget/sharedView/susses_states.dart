import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';

class SussesStates extends StatelessWidget {
  const SussesStates({Key? key, required this.message, this.image})
      : super(key: key);
  final String message;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        color: AppColors.current.primaryColor,
          alignment: Alignment.center,
          child: Column(
            children: [
              AppBarBack(title: "",big: false,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(image!),
                  Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
