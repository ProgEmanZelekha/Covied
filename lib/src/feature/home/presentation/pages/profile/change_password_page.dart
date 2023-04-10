import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/validation/pattern.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/core/widget/textFiled/custom_text_filed.dart';
import 'package:untitled/src/feature/home/presentation/manager/profile/edit_profile_cubit.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/generated/l10n.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);

  final _editPassFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
        create: (BuildContext context) => EditProfileCubit(),
        child: Builder(
          builder: (context) => _buildPage(context),
        ));
  }

  Widget _buildPage(BuildContext context) {
    var bloc = BlocProvider.of<EditProfileCubit>(context);

    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarBack(title: S.current.change_pass),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                  key: _editPassFormKey,
                  child: Column(children: [
                    CustomWidgets.textField(S.current.old_paa,
                        textInputAction: TextInputAction.next,
                        large_title: true,
                        dirEnd: false,
                        isPassword: true,
                        isRequired: true,
                        hintText: S.current.enter_password,
                        textController: bloc.oldPasswordController,
                        pattern: anyPattern,
                        errorMessage: S.current.enter_password,
                        textInputType: TextInputType.text),
                    CustomWidgets.textField(S.current.password,
                        textInputAction: TextInputAction.next,
                        large_title: true,
                        dirEnd: false,
                        isPassword: true,
                        isRequired: true,
                        hintText: S.current.enter_password,
                        textController: bloc.passwordController,
                        pattern: anyPattern,
                        errorMessage: S.current.enter_password,
                        textInputType: TextInputType.text),
                    CustomWidgets.textField(S.current.confirm_password,
                        large_title: true,
                        dirEnd: false,
                        isPassword: true,
                        isRequired: true,
                        hintText: S.current.enter_confirm_password,
                        textController: bloc.confirmController,
                        pattern: anyPattern,
                        errorMessage: S.current.enter_confirm_password,
                        textInputType: TextInputType.text),
                  ])),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  child: customButton(S.current.save, () {
                    if (_editPassFormKey.currentState?.validate() ?? false) {
                      // bloc?.otpStartTimer();
                      context.router.pop();
                    }
                  }),
                ),
              ),
            ),
          ]),
    );
  }
}
