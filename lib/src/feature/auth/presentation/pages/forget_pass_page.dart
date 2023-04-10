import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/core/validation/pattern.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/feature/auth/presentation/widgets/auth_back.dart';
import 'package:untitled/src/core/widget/textFiled/custom_text_filed.dart';
import 'package:untitled/src/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:untitled/src/generated/l10n.dart';

class ForgetPassPage extends StatelessWidget {
  AuthCubit? bloc;
  final _forgetFormKey = GlobalKey<FormState>();

  ForgetPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<AuthCubit>(context);

    return AuthBack(
        title: S.current.forget_password,
        hasBack: true,
        body: loginBody(context));
  }

  Widget loginBody(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        Form(
            key: _forgetFormKey,
            child: Column(children: [
              CustomWidgets.textField(S.current.email,
                  large_title: true,
                  dirEnd: false,
                  hintText: S.current.enter_email,
                  textController: bloc?.emailController,
                  pattern: emailPattern,
                  errorMessage: S.current.enter_email,
                  isRequired: true,
                  textInputType: TextInputType.emailAddress),
            ])),
        SizedBox(
          height: 40.h,
        ),
        customButton(S.current.send, () {
          if (_forgetFormKey.currentState?.validate() ?? false) {
            bloc?.otpStartTimer();
            context.router.push(OtpRoute());
          }
        }),
        SizedBox(
          height: 30.h,
        ),
      ],
    );
  }
}
