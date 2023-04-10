import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/src/core/bloc/base_state.dart';


class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitial());
}
