import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/src/app/bloc/app_bloc.dart';
import 'package:untitled/src/feature/home/presentation/widgets/app_bar_back.dart';
import 'package:untitled/src/feature/home/presentation/widgets/item_select_profile.dart';
import 'package:untitled/src/generated/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
  builder: (context, state) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBarBack(
            title: S.current.setting,
          ),
          SizedBox(
            height: 20.h,
          ),
          ItemProfileSelect(
            padding: 8.w,
            title: S.current.change_language,
            image: Assets.images.settingLanguage,
            onClick: () {
              BlocProvider.of<AppBloc>(context).add(LanguageEvent(
                  languageCode:
                      (BlocProvider.of<AppBloc>(context).languageCode) == "ar"
                          ? "en"
                          : "ar"));
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          ItemProfileSelect(
            padding: 8.w,
            title: S.current.change_them,
            image: Assets.images.settingThem,
            onClick: () {
              BlocProvider.of<AppBloc>(context).add(ThemEvent(
                  them: (BlocProvider.of<AppBloc>(context).modeThem) == "dark"
                      ? "light"
                      : "dark"));
            },
          ),
        ],
      ),
    );
  },
);
  }
}
