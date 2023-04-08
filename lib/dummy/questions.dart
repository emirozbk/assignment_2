import 'package:quiz_app/models/question_model.dart';

class DummyData {
  final List<QuestionModel> _questions = [
    QuestionModel(
      "Which country is home to the kangaroo?",
      ['Australia', 'New Zealand', 'Madagascar', 'Indonesia'],
      0,
    ),
    QuestionModel(
      "What is the capital of Spain?",
      ['Barcelona', 'Madrid', 'Valencia', 'Seville'],
      1,
    ),
    QuestionModel(
      "What is the largest planet in our solar system?",
      ['Mars', 'Saturn', 'Jupiter', 'Neptune'],
      2,
    ),
  ];
  List<QuestionModel> get questions => _questions;
}
