import 'package:equatable/equatable.dart';

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
