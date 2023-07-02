import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/question_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class ChangeActive extends HomeState {
  final int active;

  const ChangeActive(this.active);

  @override
  List<Object> get props => [active];
}

class ChangeSelectedActive extends HomeState {
  final QuestionModel questionModel;

  const ChangeSelectedActive(this.questionModel);

  @override
  List<Object> get props => [questionModel];
}

class ChangeNextActive extends HomeState {
  final bool next;

  const ChangeNextActive(this.next);

  @override
  List<Object> get props => [next];
}

class HomeLoading extends HomeState {
  final bool show;

  const HomeLoading(this.show);

  @override
  List<Object> get props => [show];
}

class HomeResult extends HomeState {
  final bool haveCovid;

  const HomeResult(this.haveCovid);

  @override
  List<Object> get props => [];
}

class ChangePreviousActive extends HomeState {
  final bool previous;

  const ChangePreviousActive(this.previous);

  @override
  List<Object> get props => [previous];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}

class PickImageFileState extends HomeState {
  final File image;

  const PickImageFileState({required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [image];
}
