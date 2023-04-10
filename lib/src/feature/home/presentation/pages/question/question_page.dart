import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_cubit.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/question_model.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/item_question.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/generated/l10n.dart';

class QuestionPage extends StatelessWidget {
  QuestionPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (context) {
          return _buildPage(context);
        }
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      backgroundColor: AppColors.current.primaryColor,
      body: Column(
        children: [
          AppBarBack(
            title: S.current.test_select_1,
            big: false,
          ),
          Expanded(
            child: Container(
              color: AppColors.current.primaryColor,
              child: CarouselSlider(
                items: bloc.imageSliders,
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: false,
                    initialPage: 1,
                    viewportFraction: 0.9,
                    aspectRatio: 1.0,
                    reverse: false,
                    enableInfiniteScroll: false),
                carouselController: bloc.controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
