import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:testline_quiz_app/features/quiz/models/option.dart';
import 'package:testline_quiz_app/features/quiz/models/question.dart';
import 'package:testline_quiz_app/features/quiz/screens/result.dart';

import '../models/quiz.dart';
class QuizController extends GetxController {
  static QuizController get instance => Get.find();

  RxBool isLoading = false.obs;
  RxList<Question> questions = <Question>[].obs; 
  RxList<Option> options = <Option>[].obs;

  Future<Quiz> getQuiz () async {
    isLoading.value = true;
    // pastYearMovies.clear();
    var url = Uri.parse(
          "https://api.jsonserve.com/Uw5CrX");
      http.Response resp = await http.get(url);

      Map<String, dynamic> data = jsonDecode(resp.body);
      return Quiz.fromMap(data);
  }

  void calculateResult(List<int> answersIndex, Quiz quiz, int time) {
      isLoading.value = true;
      double marks = 0;
      int correct = 0;
      int wrong = 0;
      int notAttempted = 0;

      for (int i = 0; i < answersIndex.length; i++) {
        if (answersIndex[i] == -1) {
          notAttempted++;
          continue;
        }
        if (quiz.questions[i].options[answersIndex[i]].isCorrect) {
          marks += quiz.correctAnswerMarks;
          correct++;
        } else {
          marks -= quiz.wrongAnswerMarks;
          wrong++;
        }
      }
      isLoading.value = false;
      Get.to(() => ResultScreen(
        marks: marks, correct: correct, wrong: wrong, notAttempted: notAttempted, quiz: quiz, time: time)
      );
                    
  }
}