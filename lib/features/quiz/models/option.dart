// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Option {
  final String option;
  final bool isCorrect;
  Option({
    required this.option,
    required this.isCorrect,
  });

  Option copyWith({
    String? option,
    bool? isCorrect,
  }) {
    return Option(
      option: option ?? this.option,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'option': option,
      'isCorrect': isCorrect,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
      option: map['description'] ?? '',
      isCorrect: map['is_correct'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) => Option.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Option(option: $option, isCorrect: $isCorrect)';

  @override
  bool operator ==(covariant Option other) {
    if (identical(this, other)) return true;
  
    return 
      other.option == option &&
      other.isCorrect == isCorrect;
  }

  @override
  int get hashCode => option.hashCode ^ isCorrect.hashCode;
}
