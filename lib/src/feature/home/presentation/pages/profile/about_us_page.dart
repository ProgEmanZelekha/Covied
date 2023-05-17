import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarBack(title: "About Us"),
          Expanded(
              child: ListView(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                child: customButton("رضوى محمد احمد حامد زليخة", () {}),

              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                child: customButton("ندى محمود عبد المقصود محمد", () {}),

              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                child: customButton("آسر عاهد كمال الشافعى", () {}),

              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                child: customButton("احمد طارق عبد الفتاح بطيقة", () {}),

              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                child: customButton("احمد عطية ابراهيم الفقى", () {}),

              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                child: customButton("محمد عماد طة الشازلى", () {}),

              ),
            ],
          ))
        ],
      ),
    );
  }
}
