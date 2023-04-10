
import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class BaseInitial extends BaseState {
  @override
  List<Object> get props => [];
}
