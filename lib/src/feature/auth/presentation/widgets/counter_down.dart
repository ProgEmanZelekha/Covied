import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/styles/app_colors.dart';
import 'package:untitled/resource/styles/values.dart';
import 'package:untitled/src/feature/auth/presentation/manager/auth_cubit.dart';
import 'package:untitled/src/generated/l10n.dart';

class CounterDown extends StatelessWidget {
  CounterDown({Key? key}) : super(key: key);
  AuthCubit? bloc;

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (ps, cs) => cs is OtpCounter,
      builder: (context, state) {
        if (state is OtpCounter) {
          if (state.time > 0) {
            return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.current.resend_code_in,
                    style: blackText12,
                  ),
                  TweenAnimationBuilder<Duration>(
                      duration:
                      Duration(seconds: bloc!.duration),
                      tween: Tween(
                          begin:
                          Duration(seconds: bloc!.duration),
                          end: Duration.zero),
                      onEnd: () {
                        bloc?.otpFinishTimer();
                      },
                      builder: (BuildContext context, Duration value,
                          Widget? child) {
                        final minutes = value.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, '0');
                        final seconds = value.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, '0');
                        return Text(' $minutes:$seconds',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                              AppColors.current.secondaryTextColor,
                              fontSize: 12.sp,
                            ));
                      })
                ]);
          } else {
            return Center(
              child: RichText(
                text: TextSpan(
                    text: S.current.receive_code,
                    style: blackText12,
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                        ),
                      ),
                      TextSpan(
                          text: S.current.resend,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              bloc?.otpStartTimer();
                            },
                          style: TextStyle(
                            color: AppColors.current.secondaryTextColor,
                            fontSize: 12.sp,
                          ))
                    ]),
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
