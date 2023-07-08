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

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  AuthCubit? bloc;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<AuthCubit>(context);

    return AuthBack(title: S.current.login, body: loginBody(context));
  }

  Widget loginBody(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Form(
            key: _loginFormKey,
            child: Column(children: [
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
                  large_title: true,
                  dirEnd: false,
                  isPassword: true,
                  isRequired: true,
                  hintText: S.current.enter_password,
                  textController: bloc?.passwordController,
                  pattern: anyPattern,
                  errorMessage: S.current.enter_password,
                  textInputType: TextInputType.text),
            ])),
        Row(
          children: [
            Expanded(
              child: ListTileTheme(
                horizontalTitleGap: 0,
                contentPadding: EdgeInsets.zero,
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (ps, cs) => cs is RememberCheck,
                      builder: (context, state) {
                        return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          activeColor: AppColors.current.secondaryColor,
                          title: Text(S.current.remember_me),
                          value: bloc?.rememberCheckedValue,
                          onChanged: (newValue) {
                            bloc?.changeRemember();
                          },
                          controlAffinity: ListTileControlAffinity
                              .leading, //  <-- leading Checkbox
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.router.push(ForgetPassRoute());
              },
              child: Text(
                S.current.forget_password,
                style: TextStyle(
                  color: AppColors.current.secondaryTextColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        customButton(S.current.login, () {
          if (_loginFormKey.currentState?.validate() ?? false) {
            bloc?.login();
          }
        }),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.current.have_account,
              style: blackText14,
            ),
            SizedBox(
              width: 5.w,
            ),
            InkWell(
              onTap: () {
                context.router.push(RegisterRoute());
              },
              child: Text(
                S.current.sign_up_now,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.current.secondaryTextColor,
                    fontSize: 14.sp),
              ),
            ),

          ],
        ),

        SizedBox(
          height: 30.h,
        ),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              context.router.push(HomeContainer());
              context.router.popUntil((route) => route == HomeContainer());
            },
            child: Text(
              "Skip",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.current.secondaryTextColor,
                  fontSize: 14.sp),
            ),
          ),
        ),
      ],
    );
  }
}
