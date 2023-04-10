import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/src/app/bloc/app_bloc.dart';
import 'package:untitled/src/core/validation/pattern.dart';
import 'package:untitled/src/core/widget/button.dart';
import 'package:untitled/src/core/widget/textFiled/custom_text_filed.dart';
import 'package:untitled/src/feature/home/presentation/manager/profile/edit_profile_cubit.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/generated/l10n.dart';

class EditeProfilePage extends StatelessWidget {
  EditeProfilePage({Key? key}) : super(key: key);
  final _editFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    var bloc = BlocProvider.of<EditProfileCubit>(context);
    bloc.nameController.text = BlocProvider.of<AppBloc>(context).name ?? "";
    bloc.emailController.text = BlocProvider.of<AppBloc>(context).email ?? "";
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarBack(title: S.current.edit),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                  key: _editFormKey,
                  child: Column(children: [
                    CustomWidgets.textField(S.current.name,
                        textInputAction: TextInputAction.done,
                        large_title: true,
                        dirEnd: false,
                        hintText: S.current.enter_name,
                        textController: bloc.nameController,
                        pattern: anyPattern,
                        errorMessage: S.current.enter_name,
                        isRequired: true,
                        textInputType: TextInputType.text),
                    CustomWidgets.textField(S.current.email,
                        isEnable: false,
                        large_title: true,
                        dirEnd: false,
                        hintText: S.current.enter_email,
                        textController: bloc.emailController,
                        pattern: emailPattern,
                        errorMessage: S.current.enter_email,
                        isRequired: true,
                        textInputType: TextInputType.emailAddress),
                  ])),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  child: customButton(S.current.save, () {
                    if (_editFormKey.currentState?.validate() ?? false) {
                      bloc.editProfile();
                      BlocProvider.of<AppBloc>(context).name =
                          bloc.nameController.text;
                      BlocProvider.of<AppBloc>(context).add(LanguageEvent(
                          languageCode:
                              BlocProvider.of<AppBloc>(context).languageCode));
                    }
                  }),
                ),
              ),
            ),
          ]),
    );
  }
}
