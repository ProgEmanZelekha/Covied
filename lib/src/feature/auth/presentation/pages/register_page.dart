import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/core/validation/pattern.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/feature/auth/presentation/widgets/auth_back.dart';
import 'package:untitled/src/core/widget/textFiled/custom_text_filed.dart';
import 'package:untitled/src/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:untitled/src/generated/l10n.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  AuthCubit? bloc;
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<AuthCubit>(context);

    return AuthBack(title: S.current.sign_up, body: registerBody(context));
  }

  Widget registerBody(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Form(
            key: _registerFormKey,
            child: Column(children: [
              CustomWidgets.textField(S.current.name,
                  textInputAction: TextInputAction.next,
                  large_title: true,
                  dirEnd: false,
                  hintText: S.current.enter_name,
                  textController: bloc?.nameController,
                  pattern: anyPattern,
                  errorMessage: S.current.enter_name,
                  isRequired: true,
                  textInputType: TextInputType.text),
              CustomWidgets.textField(S.current.email,
                  textInputAction: TextInputAction.next,
                  large_title: true,
                  dirEnd: false,
                  hintText: S.current.enter_email,
                  textController: bloc?.emailController,
                  pattern: emailPattern,
                  errorMessage: S.current.enter_email,
                  isRequired: true,
                  textInputType: TextInputType.emailAddress),
              CustomWidgets.textField(S.current.password,
                  textInputAction: TextInputAction.next,
                  large_title: true,
                  dirEnd: false,
                  isPassword: true,
                  isRequired: true,
                  hintText: S.current.enter_password,
                  textController: bloc?.passwordController,
                  pattern: anyPattern,
                  errorMessage: S.current.enter_password,
                  textInputType: TextInputType.text),
              CustomWidgets.textField(S.current.confirm_password,
                  large_title: true,
                  dirEnd: false,
                  isPassword: true,
                  isRequired: true,
                  hintText: S.current.enter_confirm_password,
                  textController: bloc?.confirmController,
                  pattern: anyPattern,
                  errorMessage: S.current.enter_confirm_password,
                  textInputType: TextInputType.text),
            ])),
        SizedBox(
          height: 5.h,
        ),
        customButton(S.current.sign_up, () {
          if (_registerFormKey.currentState?.validate() ?? false) {
            bloc?.register();
          }
        }),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.current.already_have_account,
              style: blackText14,
            ),
            SizedBox(
              width: 5.w,
            ),
            InkWell(
              onTap: () {
                context.router.pop();
              },
              child: Text(
                S.current.login_now,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.current.secondaryTextColor,
                    fontSize: 14.sp),
              ),
            )
          ],
        )
      ],
    );
  }
}
