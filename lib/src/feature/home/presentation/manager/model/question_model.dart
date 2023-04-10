class QuestionModel {
  final String image;
  final String question;
  final List<AnswerModel> answer;

  QuestionModel(
      {required this.image, required this.question, required this.answer});
}

class AnswerModel {
  final String answer;
  final bool active;

  AnswerModel({required this.answer, required this.active});
}
