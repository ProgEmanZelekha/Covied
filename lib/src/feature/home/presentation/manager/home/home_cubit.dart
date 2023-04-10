import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/question_model.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/item_question.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final CarouselController controller = CarouselController();
  var imageSliders = [
    ItemQuestion(
        questionModel: QuestionModel(
            image: Assets.images.home1.path,
            question: "sklgljdflkgj",
            answer: [
              AnswerModel(answer: "sdfds", active: true),
              AnswerModel(answer: "sdfds", active: false)
            ])),
    // ItemQuestion(),
    // ItemQuestion(),
    // ItemQuestion(),
    // ItemQuestion(),
  ];
  void homeInitial() async {}
}
