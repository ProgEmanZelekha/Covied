import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_cubit.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/question_model.dart';

class ItemQuestion extends StatelessWidget {
  ItemQuestion({Key? key, required this.questionModel}) : super(key: key);
  QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);
    return Container(
      padding: EdgeInsets.all(
        16.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: Colors.white,
      ),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (ps,cs)=>cs is ChangeSelectedActive,
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.all(10.w),
                child: SizedBox(
                    height: 70.w,
                    width: 70.w,
                    child: Image.asset(questionModel.image)),
              ),
              Text(
                questionModel.question,
                style: TextStyle(
                    color: AppColors.current.secondaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              for (var element in questionModel.answer)
                InkWell(
                  onTap: () {
                    for (var e in questionModel.answer) {
                      e.id == element.id
                          ? element.active = !element.active
                          : e.active = false;
                    }
                    bloc.changeSelected(questionModel);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: element.active
                          ? AppColors.current.secondaryColor
                          : AppColors.current.primaryColor,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 20.w,
                            width: 20.w,
                            child: SvgPicture.asset(element.active
                                ? Assets.images.activeCheckCircle
                                : Assets.images.checkCircle)),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          element.answer,
                          style: whiteText14,
                        ),
                      ],
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
