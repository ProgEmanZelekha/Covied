import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/feature/auth/presentation/widgets/auth_back.dart';
import 'package:untitled/src/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:untitled/src/feature/auth/presentation/widgets/counter_down.dart';
import 'package:untitled/src/generated/l10n.dart';

class OtpPage extends StatelessWidget {
  OtpPage({Key? key}) : super(key: key);
  AuthCubit? bloc;
  final pinFormKey = GlobalKey<FormState>();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    bloc = BlocProvider.of<AuthCubit>(context);
    return AuthBack(
        title: S.current.verify_email,
        hasBack: true,
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Text(S.current.enter_verify_code,
                  style: blackText16, textAlign: TextAlign.center),
            ),
            SizedBox(height: 40.h),
            Form(
              key: pinFormKey,
              child: Pinput(
                controller: bloc?.pinController,
                focusNode: focusNode,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                closeKeyboardWhenCompleted: true,
                keyboardAppearance: Brightness.dark,
                keyboardType: TextInputType.number,
                validator: (pin) {
                  if (pin!.isEmpty || pin.length < 4) {
                    return (S.current.enter_code_plz);
                  } else {
                    return null;
                  }
                },
                focusedPinTheme: PinTheme(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.current.primaryColor, width: 2),
                        borderRadius: BorderRadius.circular(15.0))),
                defaultPinTheme: PinTheme(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.current.primaryTextColor,
                            width: 2),
                        borderRadius: BorderRadius.circular(15.0))),
                errorPinTheme: PinTheme(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.current.secondaryTextColor,
                            width: 2),
                        borderRadius: BorderRadius.circular(15.0))),
              ),
            ),
            SizedBox(height: 40.h),
            CounterDown(),
            SizedBox(height: 40.h),
            customButton(S.current.verify, () {
              focusNode.unfocus();
              if (pinFormKey.currentState!.validate()) {
                bloc!.otp();
              }
            }),
          ],
        ));
  }
}
