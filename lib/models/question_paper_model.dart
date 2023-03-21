// To parse this JSON data, do
//
//     final questionPaperModel = questionPaperModelFromJson(jsonString);

import 'dart:convert';

QuestionPaperModel questionPaperModelFromJson(String str) => QuestionPaperModel.fromJson(json.decode(str));

String questionPaperModelToJson(QuestionPaperModel data) => json.encode(data.toJson());

class QuestionPaperModel {
  QuestionPaperModel({
    this.id,
    this.title,
    this.imageUrl,
    this.description,
    this.timeSeconds,
    this.questions,
  });

  String? id;
  String? title;
  String? imageUrl;
  String? description;
  int? timeSeconds;
  List<Question>? questions;

  factory QuestionPaperModel.fromJson(Map<String, dynamic> json) => QuestionPaperModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        description: json["Description"],
        timeSeconds: json["time_seconds"],
        questions: json["questions"] == null
            ? []
            : List<Question>.from(
                json["questions"]!.map((x) => Question.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "Description": description,
        "time_seconds": timeSeconds,
        "questions": questions == null
            ? []
            : List<dynamic>.from(
                questions!.map((x) => x.toJson()),
              ),
      };
}

class Question {
  Question({
    this.id,
    this.question,
    this.answers,
    this.correctAnswer,
  });

  String? id;
  String? question;
  List<Answer>? answers;
  CorrectAnswer? correctAnswer;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
        correctAnswer: correctAnswerValues.map[json["correct_answer"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers": answers == null ? [] : List<dynamic>.from(answers!.map((x) => x.toJson())),
        "correct_answer": correctAnswerValues.reverse[correctAnswer],
      };
}

class Answer {
  Answer({
    this.identifier,
    this.answer,
  });

  CorrectAnswer? identifier;
  String? answer;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        identifier: correctAnswerValues.map[json["identifier"]]!,
        answer: json["Answer"],
      );

  Map<String, dynamic> toJson() => {
        "identifier": correctAnswerValues.reverse[identifier],
        "Answer": answer,
      };
}

enum CorrectAnswer { A, B, C, D }

final correctAnswerValues = EnumValues({
  "A": CorrectAnswer.A,
  "B": CorrectAnswer.B,
  "C": CorrectAnswer.C,
  "D": CorrectAnswer.D,
});

getEnumValue(value) {
  switch (value) {
    case CorrectAnswer.A:
      return "A";
    case CorrectAnswer.B:
      return "B";
    case CorrectAnswer.C:
      return "C";
    case CorrectAnswer.D:
      return "D";
    default:
  }
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
