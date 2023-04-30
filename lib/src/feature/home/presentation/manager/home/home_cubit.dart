import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/question_model.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/item_question.dart';
import 'package:untitled/src/generated/l10n.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final CarouselController controller = CarouselController();
  List<ItemQuestion> imageSliders = [];

  void homeInitial() async {
    for (var i = 0; i < 8; i++) {
      imageSliders.add(
        ItemQuestion(
            questionModel: QuestionModel(
                image: Assets.images.home1.path,
                question: S.current.nQuestion(i),
                answer: [
              AnswerModel(answer: "sdfds", active: true),
              AnswerModel(answer: "sdfds", active: false)
            ])),
      );
    }
  }
}
