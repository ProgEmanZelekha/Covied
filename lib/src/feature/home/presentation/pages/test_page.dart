import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/app/bloc/app_bloc.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_cubit.dart';
import 'package:untitled/src/feature/home/presentation/widgets/corners_back.dart';
import 'package:untitled/src/feature/home/presentation/widgets/item_select_widget.dart';
import 'package:untitled/src/generated/l10n.dart';

class TestPage extends StatelessWidget {
  TestPage({Key? key}) : super(key: key);
  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              CornersBack(
                  height: .3,
                  radius: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.images.home1.path,
                        width: 100.w,
                        height: 100.w,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        S.current.test_title,
                        style: whiteText16,
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                onTap: () {
                  _appRouter.push(QuestionRoute(type: 1));
                },
                child: ItemSelectWidget(
                  text: S.current.test_select_1,
                  imageSize: 80.w,
                  image: Assets.images.test1,
                  isSvg: true,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  // bloc.pickImage();
                  _appRouter.push(PickImage(type: 1));
                },
                child: ItemSelectWidget(
                  text: S.current.test_select_2,
                  imageSize: 80.w,
                  image: Assets.images.test2,
                  isSvg: true,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  onTap: () {
                    _appRouter.push(QuestionRoute(type: 2));
                  },
                  child: ItemSelectWidget(
                    text: S.current.test_select_3,
                    imageSize: 80.w,
                  )),
            ]);
      },
    );
  }
}
