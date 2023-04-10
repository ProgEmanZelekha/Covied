import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/src/core/preferences/Prefs.dart';
import 'package:untitled/src/generated/l10n.dart';

part 'edit_profile_state.dart';

@Injectable()
class EditProfileCubit extends Cubit<EditProfileState> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final confirmController = TextEditingController();
  final passwordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  Prefs prefs = GetIt.instance.get<Prefs>();

  EditProfileCubit() : super(EditProfileInitial());
  final FirebaseAuth _firebaseAuth = GetIt.instance.get<FirebaseAuth>();

  Future<void> editProfile() async {
    emit(const EditProfileLoading(show: true));
    try {
      var user = _firebaseAuth.currentUser;
      await user?.updateDisplayName(nameController.text);
      await prefs.setNameString(nameController.text);
      emit(EditProfileSusses(message:S.current.name_updated));
    } on FirebaseAuthException catch (e) {
      emit(EditProfileError(message: e.message ?? ""));
    }
    emit(const EditProfileLoading(show: false));
  }

  Future<void> editPassword() async {
    emit(const EditProfileLoading(show: true));
    try {
      var user = _firebaseAuth.currentUser;
      await user?.updatePassword(confirmController.text);
      await prefs.setPasswordString(confirmController.text);
      emit(EditProfileSusses(message: S.current.pass_updated));
    } on FirebaseAuthException catch (e) {
      emit(EditProfileError(message: e.message ?? ""));
    }
    emit(const EditProfileLoading(show: false));
  }
}
