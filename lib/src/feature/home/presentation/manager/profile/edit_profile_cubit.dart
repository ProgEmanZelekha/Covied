import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final confirmController = TextEditingController();
  final passwordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  EditProfileCubit() : super(EditProfileInitial());
}
