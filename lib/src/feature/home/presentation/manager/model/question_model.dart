class QuestionModel {
  final String image;
  final String question;
  final int id;
  final List<AnswerModel> answer;

  QuestionModel(
      {required this.image, required this.question, required this.answer,required this.id});
}

class AnswerModel {
  final String answer;
  bool active;
  final int id;

  AnswerModel({required this.answer, required this.active,required this.id});
}
