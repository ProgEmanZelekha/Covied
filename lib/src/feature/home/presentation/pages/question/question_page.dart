import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/item_question.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/generated/l10n.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({Key? key}) : super(key: key);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var imageSliders = [
      ItemQuestion(),
      ItemQuestion(),
      ItemQuestion(),
      ItemQuestion(),
      ItemQuestion(),
    ];
    return Scaffold(
      backgroundColor: AppColors.current.primaryColor,
      body: Column(
        children: [
          AppBarBack(
            title: S.current.test_select_1,
            big: false,
          ),
          Container(
            color: AppColors.current.primaryColor,
            child: CarouselSlider(
              items: imageSliders,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 200,
                autoPlay: false,
                initialPage: 1,
                viewportFraction: 0.9,
                aspectRatio: 2.0,
              ),
              carouselController: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
