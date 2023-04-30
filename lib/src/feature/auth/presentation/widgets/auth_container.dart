import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/app/bloc/app_bloc.dart';
import 'package:untitled/src/core/navigation/routes/AppRouter.gr.dart';
import 'package:untitled/src/core/widget/loading/full_over_loading.dart';
import 'package:untitled/src/core/widget/sharedView/susses_dialog.dart';
import 'package:untitled/src/feature/auth/presentation/manager/auth_cubit.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (BuildContext context) => AuthCubit()..authInitial(),
        child: Builder(
          builder: (context) => _buildPage(context),
        ));
  }

  Widget _buildPage(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          SussesDialog(context: context, message: state.message).showError();
        }
      },
      builder: (context, state) {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LoginSusses) {
              BlocProvider.of<AppBloc>(context).getUserData();
              context.router.push(HomeContainer());
              context.router.popUntil((route) => route == HomeContainer());
            } else if (state is RegisterSusses) {
              context.router.pop();
            }
          },
          builder: (context, state) {
            return BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (ps, cs) =>
                  cs is AuthLoading || cs is AuthError || cs is AuthSusses,
              builder: (context, state) {
                return Stack(
                  children: [
                    const AutoRouter(),
                    Visibility(
                        visible: (state is AuthLoading) && state.show,
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
