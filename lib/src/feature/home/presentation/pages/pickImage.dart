import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_cubit.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/generated/l10n.dart';

class PickImage extends StatelessWidget {
  final int type;

  const PickImage({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeCubit>(context);

    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.w),
        color: Colors.white,
      ),
      child: Column(
          children: [
            Visibility(
                visible: type == 1,
                child: AppBarBack(
                  title: S.current.pick_image,
                  big: false,
                )),
            SizedBox(
              height: 10.h,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (ps, cs) => cs is PickImageFileState,
              builder: (context, state) {
                return Expanded(
                    child: bloc.image != null
                        ? Image.file(bloc.image!)
                        : Image.asset(Assets.images.appIcon.path));
              },
            ),
            Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Expanded(
                    child: customButton(
                      S.current.camera,
                      () {
                        bloc.pickImageCamera();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                    child: customButton(
                      S.current.gallery,
                      () {
                        bloc.pickImage();
                      },
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: type == 1 && bloc.image != null,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                child: customButton(S.current.submit, () {
                  bloc.getResult();
                }),
              ),
            )
          ],
        ),
    );
  }
}
