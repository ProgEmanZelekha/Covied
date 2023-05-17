import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/question_model.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/item_question.dart';
import 'package:untitled/src/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final CarouselController controller = CarouselController();
  List<Widget> imageSliders = [];
  bool previous = false;
  bool next = true;

  File? image;
  File? imageTemp;

  void homeInitial() async {
    List<String> lines = S.current.nQuestion.split('\$');
    for (var i = 0; i < lines.length; i++) {
      if (lines[i].isNotEmpty) {
        var questions = lines[i].split('&');
        var answers = questions[1].split(',');
        var answerId = 0;
        imageSliders.add(
          ItemQuestion(
              questionModel: QuestionModel(
                  id: i + 1,
                  image: Assets.images.home1.path,
                  question: questions[0],
                  answer: answers
                      .map((element) => AnswerModel(
                          answer: element, active: false, id: answerId++))
                      .toList())),
        );
      }
    }
  }

  void changeSelected(QuestionModel questionModel) {
    for (var e in imageSliders) {
      if(e is ItemQuestion){
      if (e .questionModel.id == questionModel.id) {
        e.questionModel = questionModel;
      }
    }}
    emit(ChangeSelectedActive(
        QuestionModel(image: "", question: "", answer: [], id: 1)));
  }

  void changeQuestions(int index) {
    if (index == 0) {
      emit(ChangeNextActive(true));
      emit(ChangePreviousActive(false));
      previous = false;
      next = true;
    } else if (index == imageSliders.length - 1) {
      emit(ChangeNextActive(false));
      emit(ChangePreviousActive(true));
      previous = true;
      next = false;
    } else {
      emit(ChangeNextActive(true));
      emit(ChangePreviousActive(true));
      previous = true;
      next = true;
    }
  }

  Future<bool> getResult() async {
    var haveCovid = true;
    emit(HomeError(
        message:
            haveCovid ? S.current.have_covied : S.current.not_have_covied));

    return haveCovid;
  }

  void pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      emit.call(PickImageFileState(image: this.image!));
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      emit.call(PickImageFileState(image: this.image!));
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
