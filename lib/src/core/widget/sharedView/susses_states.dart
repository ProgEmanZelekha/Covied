import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SussesStates extends StatelessWidget {
  const SussesStates({Key? key, required this.message, this.image})
      : super(key: key);
  final String message;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 16.sp),
            )
          ],
        ));
  }
}
