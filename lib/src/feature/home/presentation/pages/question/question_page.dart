import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart'
    as router;
import 'package:untitled/src/core/widget/loading/full_over_loading.dart';
import 'package:untitled/src/core/widget/sharedView/susses_dialog.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_cubit.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/question_model.dart';
import 'package:untitled/src/feature/home/presentation/pages/pickImage.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/item_question.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/generated/l10n.dart';

class QuestionPage extends StatelessWidget {
  final int type; //1 questions only , 2 question & image
  const QuestionPage({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..homeInitial(),
      child: Builder(builder: (context) {
        return _buildPage(context);
      }),
    );
  }

  Widget _buildPage(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);
    if (type == 2) {
      bloc.imageSliders.add(PickImage(
        type: 2,
      ));
    }
    return Scaffold(
        backgroundColor: AppColors.current.primaryColor,
        body: BlocListener<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeError) {
              if (state.message.isNotEmpty) {
                SussesDialog(context: context, message: state.message)
                    .showError();
              }
            } else if (state is HomeResult) {
              context.router.pop();
              context.router.push(router.SussesStates(
                  message: state.haveCovid
                      ? S.current.have_covied
                      : S.current.not_have_covied,
                  image: state.haveCovid
                      ? Assets.images.stayHome.path
                      : Assets.images.youFine.path));
            }
          },
          child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (ps, cs) => cs is HomeLoading,
            builder: (context, state) {
              return Stack(
                children: [
                  Container(
                    color: AppColors.current.primaryColor,
                    child: Column(
                      children: [
                        AppBarBack(
                          title: S.current.test_select_1,
                          big: false,
                        ),
                        Expanded(
                          child: CarouselSlider(
                            items: bloc.imageSliders,
                            options: CarouselOptions(
                                enlargeCenterPage: true,
                                autoPlay: false,
                                initialPage: 0,
                                viewportFraction: 0.9,
                                aspectRatio: 1.0,
                                reverse: false,
                                enableInfiniteScroll: false,
                                onPageChanged: (int index,
                                    CarouselPageChangedReason reason) {
                                  bloc.changeQuestions(index);
                                }),
                            carouselController: bloc.controller,
                          ),
                        ),
                        BlocBuilder<HomeCubit, HomeState>(
                          buildWhen: (ps, cs) =>
                              cs is ChangePreviousActive ||
                              cs is ChangeNextActive,
                          builder: (context, state) {
                            return Row(
                              children: [
                                Visibility(
                                  child: InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(8.w),
                                      margin: EdgeInsets.all(16.w),
                                      decoration: BoxDecoration(
                                          color:
                                              AppColors.current.secondaryColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16.w))),
                                      child: Text(
                                        S.current.previous,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                    onTap: () {
                                      bloc.controller.previousPage();
                                    },
                                  ),
                                  visible: bloc.previous,
                                ),
                                Spacer(),
                                InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(8.w),
                                    margin: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                        color: AppColors.current.secondaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16.w))),
                                    child: Text(
                                      bloc.next
                                          ? S.current.next
                                          : S.current.submit,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.sp),
                                    ),
                                  ),
                                  onTap: () {
                                    if (bloc.next) {
                                      bloc.controller.nextPage();
                                    } else {
                                      bloc.getResult(type == 1 ? 2 : 3);
                                    }
                                  },
                                )
                              ],
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  Visibility(
                      visible: state is HomeLoading && state.show,
                      child: FullOverLoading()),
                ],
              );
            },
          ),
        ));
  }
}
