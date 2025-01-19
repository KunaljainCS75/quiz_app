// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:testline_quiz_app/features/quiz/models/question.dart';

class Quiz {
  final String title;
  final String topic;
  final double correctAnswerMarks;
  final double wrongAnswerMarks;
  final int totalQuestions;
  final List<Question> questions;
  Quiz({
    required this.title,
    required this.topic,
    required this.correctAnswerMarks,
    required this.wrongAnswerMarks,
    required this.totalQuestions,
    required this.questions,
  });

  Quiz copyWith({
    String? title,
    String? topic,
    double? correctAnswerMarks,
    double? wrongAnswerMarks,
    int? totalQuestions,
    List<Question>? questions,
  }) {
    return Quiz(
      title: title ?? this.title,
      topic: topic ?? this.topic,
      correctAnswerMarks: correctAnswerMarks ?? this.correctAnswerMarks,
      wrongAnswerMarks: wrongAnswerMarks ?? this.wrongAnswerMarks,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      questions: questions ?? this.questions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'topic': topic,
      'correctAnswerMarks': correctAnswerMarks,
      'wrongAnswerMarks': wrongAnswerMarks,
      'totalQuestions': totalQuestions,
      'questions': questions.map((x) => x.toMap()).toList(),
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      title: map['title'] ?? '',
      topic: map['topic'] ?? '',
      correctAnswerMarks: double.tryParse(map['correct_answer_marks']?.toString() ?? '1.0') ?? 1.0,
      wrongAnswerMarks: double.tryParse(map['negative_marks']?.toString() ?? '-1.0') ?? -1.0,
      totalQuestions: int.tryParse(map['questions_count']?.toString() ?? '') ?? 0,
      questions: (map["questions"] as List<dynamic>).map((q) => Question.fromMap(q)).toList()
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Quiz(title: $title, topic: $topic, correctAnswerMarks: $correctAnswerMarks, wrongAnswerMarks: $wrongAnswerMarks, totalQuestions: $totalQuestions, questions: $questions)';
  }

  @override
  bool operator ==(covariant Quiz other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.topic == topic &&
      other.correctAnswerMarks == correctAnswerMarks &&
      other.wrongAnswerMarks == wrongAnswerMarks &&
      other.totalQuestions == totalQuestions &&
      listEquals(other.questions, questions);
  }

  @override
  int get hashCode {
    return title.hashCode ^
      topic.hashCode ^
      correctAnswerMarks.hashCode ^
      wrongAnswerMarks.hashCode ^
      totalQuestions.hashCode ^
      questions.hashCode;
  }
}
