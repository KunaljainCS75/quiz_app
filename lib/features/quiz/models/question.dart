// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:testline_quiz_app/features/quiz/models/option.dart';

class Question {
  final String question;
  final String solution;
  final List<Option> options;
  Question({
    required this.question,
    required this.solution,
    required this.options,
  });

  Question copyWith({
    String? question,
    String? solution,
    List<Option>? options,
  }) {
    return Question(
      question: question ?? this.question,
      solution: solution ?? this.solution,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'question': question,
      'solution': solution,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['description'] ?? '',
      solution: map['detailed_solution'] ?? '',
      options: (map['options'] as List<dynamic>).map((e) => Option.fromMap(e)).toList()
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) => Question.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Question(question: $question, solution: $solution, options: $options)';

  @override
  bool operator ==(covariant Question other) {
    if (identical(this, other)) return true;
  
    return 
      other.question == question &&
      other.solution == solution &&
      listEquals(other.options, options);
  }

  @override
  int get hashCode => question.hashCode ^ solution.hashCode ^ options.hashCode;
}
