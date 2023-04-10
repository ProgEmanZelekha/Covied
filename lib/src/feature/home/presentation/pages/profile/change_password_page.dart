import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/validation/pattern.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/core/widget/textFiled/custom_text_filed.dart';
import 'package:untitled/src/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:untitled/src/feature/home/presentation/manager/profile/edit_profile_cubit.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/generated/l10n.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key, required this.type}) : super(key: key);
  final int type;

  final _editPassFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    var bloc = type == 1
        ? BlocProvider.of<AuthCubit>(context)
        : BlocProvider.of<EditProfileCubit>(context);

    return Scaffold(
      body: ListView(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: [
            AppBarBack(
                title: type == 2
                    ? S.current.change_pass
                    : S.current.forget_password),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                  key: _editPassFormKey,
                  child: Column(children: [
                    Visibility(
                      visible: type == 2,
                      child: CustomWidgets.textField(S.current.old_paa,
                          textInputAction: TextInputAction.next,
                          large_title: true,
                          dirEnd: false,
                          isPassword: true,
                          isRequired: true,
                          hintText: S.current.enter_password,
                          textController: type == 1
                              ? (bloc as AuthCubit).oldPasswordController
                              : (bloc as EditProfileCubit)
                                  .oldPasswordController,
                          pattern: anyPattern,
                          errorMessage: S.current.enter_password,
                          textInputType: TextInputType.text),
                    ),
                    CustomWidgets.textField(S.current.password,
                        textInputAction: TextInputAction.next,
                        large_title: true,
                        dirEnd: false,
                        isPassword: true,
                        isRequired: true,
                        hintText: S.current.enter_password,
                        textController: type == 1
                            ? (bloc as AuthCubit).oldPasswordController
                            : (bloc as EditProfileCubit).passwordController,
                        pattern: anyPattern,
                        errorMessage: S.current.enter_password,
                        textInputType: TextInputType.text),
                    CustomWidgets.textField(S.current.confirm_password,
                        large_title: true,
                        dirEnd: false,
                        isPassword: true,
                        isRequired: true,
                        hintText: S.current.enter_confirm_password,
                        textController: type == 1
                            ? (bloc as AuthCubit).oldPasswordController
                            : (bloc as EditProfileCubit).confirmController,
                        pattern: anyPattern,
                        errorMessage: S.current.enter_confirm_password,
                        textInputType: TextInputType.text),
                  ])),
            ),
            Container(
              height: ScreenUtil.defaultSize.height * 1 / 3,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: customButton(S.current.save, () {
                  if (_editPassFormKey.currentState?.validate() ?? false) {
                    if (type == 1) {
                      context.router.popUntilRoot();
                    } else {
                      (bloc as EditProfileCubit).editPassword();
                    }
                  }
                }),
              ),
            ),
          ]),
    );
  }
}
