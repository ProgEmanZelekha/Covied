import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/widget/loading/full_over_loading.dart';
import 'package:untitled/src/core/widget/sharedView/susses_dialog.dart';
import 'package:untitled/src/feature/home/presentation/manager/profile/edit_profile_cubit.dart';

class EmptyProfilePage extends StatelessWidget {
  const EmptyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditProfileCubit>(
        create: (BuildContext context) => EditProfileCubit(),
        child: Builder(
          builder: (context) => _buildPage(context),
        ));
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileError) {
          SussesDialog(context: context, message: state.message).showError();
        }
      },
      builder: (context, state) {
        return BlocConsumer<EditProfileCubit, EditProfileState>(
          listener: (context, state) {
            if (state is EditProfileSusses) {
              SussesDialog(context: context, message: state.message)
                  .showError();
            }
          },
          builder: (context, state) {
            return BlocBuilder<EditProfileCubit, EditProfileState>(
              buildWhen: (ps, cs) =>
                  cs is EditProfileLoading ||
                  cs is EditProfileError ||
                  cs is EditProfileSusses,
              builder: (context, state) {
                return Stack(
                  children: [
                    const AutoRouter(),
                    Visibility(
                        visible: (state is EditProfileLoading) && state.show,
                        child: const FullOverLoading()),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
