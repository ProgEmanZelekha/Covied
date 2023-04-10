part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState extends Equatable {
  const EditProfileState();
  @override
  List<Object?> get props => [];
}

class EditProfileInitial extends EditProfileState {
  
}


class EditProfileLoading extends EditProfileState {
  final bool show;

  const EditProfileLoading({required this.show});

  @override
  List<Object> get props => [show];
}

class EditProfileError extends EditProfileState {
  final String message;

  const EditProfileError({required this.message});

  @override
  List<Object> get props => [message];
}

class EditProfileSusses extends EditProfileState {
  final String message;

  const EditProfileSusses({required this.message});

  @override
  List<Object> get props => [message];
}
