import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:untitled/resource/generated/assets.gen.dart';
import 'package:untitled/src/feature/home/presentation/manager/home/home_state.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/Image_response.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/corona_model.dart';
import 'package:untitled/src/feature/home/presentation/manager/model/question_model.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/item_question.dart';
import 'package:untitled/src/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;
import 'package:dio/dio.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final CarouselController controller = CarouselController();
  List<Widget> imageSliders = [];
  bool previous = false;
  bool next = true;

  // List? result;
  // late final Interpreter interpreter;
  // late final List<String> labels;
  // Tensor? inputTensor;
  // Tensor? outputTensor;
  File? image;

  // img.Image? imageModel;
  File? imageTemp;

  // Map<String, int>? classification;

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
      if (e is ItemQuestion) {
        if (e.questionModel.id == questionModel.id) {
          e.questionModel = questionModel;
        }
      }
    }
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

  Future<bool> getResult(type) async {
    if (type == 2) {
      if (validateQuestion()) {
        emit(HomeLoading(true));
        var result = await postData();
        emit(HomeResult(result));
        emit(HomeLoading(false));
      } else {
        emit(HomeError(message: ""));
        emit(HomeError(message: "Please Answer All Questions"));
      }
    } else if (type == 1) {
      emit(HomeLoading(true));
      var result = await postImage();
      emit( HomeResult(result));
      emit(HomeLoading(false));
    } else {
      emit(HomeLoading(true));

      var data = await Future.wait([postData(), postImage()]);
      emit(HomeLoading(false));
      if (data[0] && data[1]) {
        emit(HomeResult(true));
      } else if (data[0] || data[1]) {
        emit(HomeResult(false));
      } else {
        emit( HomeResult(true));
      }
    }

    return true;
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

  bool validateQuestion() {
    answers.clear();
    for (var e in imageSliders) {
      if (e is ItemQuestion) {
        for (int i = 0; i < e.questionModel.answer.length; i++) {
          if (e.questionModel.answer[i].active) {
            answers.add(i);
          }
        }
      }
    }
    if (answers.length == 8) {
      return true;
    } else {
      return false;
    }
  }

  List<int> answers = [];

  Future<bool> postData() async {
    var dio = GetIt.instance.get<Dio>();
    try {
      final response = await dio.post(
          'https://proj-5onb.onrender.com/predictions',
          data: {"values": answers});
      final data = CoronaModel.fromJson(response.data);
      return data.data.toString().contains("positive") ? true : false;
    } on DioError catch (e) {
      return false;
    }
  }

  Future<bool> postImage() async {
    var dio = GetIt.instance.get<Dio>();
    try {
      final response = await dio.post(
          'https://images-api-e1le.onrender.com/classify',
          data: FormData.fromMap({
            'file':
                await MultipartFile.fromFile(image!.path, filename: image!.path)
          }));
      //
      final data = ImageResponse.fromJson(response.data);
      var result = data.prediction!;
      return double.parse(result) > .5 ? false : true;
    } on DioError catch (e) {
      return false;
    }
  }

// Future<void> processImage() async {
//   if (image != null) {
//     // Read image bytes from file
//     final imageData = image?.readAsBytesSync();
//
//     // Decode image using package:image/image.dart (https://pub.dev/image)
//     imageModel = img.decodeImage(imageData!);
//
//     // Resize image for model input (Mobilenet use [224, 224])
//     final imageInput = img.copyResize(
//       imageModel!,
//       width: 224,
//       height: 224,
//     );
//
//     // Get image matrix representation [224, 224, 3]
//     final imageMatrix = List.generate(
//       imageInput.height,
//       (y) => List.generate(
//         imageInput.width,
//         (x) {
//           final pixel = imageInput.getPixel(x, y);
//           return [pixel.r, pixel.g, pixel.b];
//         },
//       ),
//     );
//
//     // Run model inference
//     await runInference(imageMatrix);
//   }
// }

// classifyImage(File image) async {
//   var output = await interpreter.runModelOnImage(
//     path: image.path,
//     numResults: 2,
//     threshold: 0.5,
//     imageMean: 127.5,
//     imageStd: 127.5,
//   );
//   print("$output kkkkkk");
//   result = output?[0];
//
//   // setState(() {
//   //   _loading = false;
//   //   _outputs = output!;
//   // });
// }
// Future<void> runInference(
//   List<List<List<num>>> imageMatrix,
// ) async {
//   // Set tensor input [1, 224, 224, 3]
//   final input = [imageMatrix];
//   // Set tensor output [1, 1001]
//   final output = [List<double>.filled(2, 0)];
//
//   // Run inference
//   interpreter.run(input, output);
//
//   // Get first output tensor
//   final result = output.first;
//
//   // Set classification map {label: points}
//   classification = <String, int>{};
//
//   for (var i = 0; i < result.length; i++) {
//     if (result[i] != 0) {
//       // Set label: points
//       classification![labels[i]] = result[i].toInt();
//     }
//   }
//   print(classification);
// }

// loadModel() async {
//   // if(interpreter.isAllocated){
//   //   interpreter.close();
//   // }
//   final options = InterpreterOptions();
//
//   // Use XNNPACK Delegate
//   if (Platform.isAndroid) {
//     options.addDelegate(XNNPackDelegate());
//   }
//   interpreter = await Interpreter.fromAsset("assets/model_COVID.tflite",
//       options: options
//       // model: "assets/model_COVID.tflite",
//       // labels.txt: "assets/labels.txt.txt",
//       );
//   // Get tensor input shape [1, 224, 224, 3]
//   inputTensor = interpreter.getInputTensors().first;
//   // Get tensor output shape [1, 1001]
//   outputTensor = interpreter.getOutputTensors().first;
//   final labelTxt = await rootBundle.loadString("assets/labels.txt");
//   labels = labelTxt.split("\n");
// }
}
