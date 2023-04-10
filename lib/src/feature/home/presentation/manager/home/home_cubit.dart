import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void homeInitial() async {}
}
