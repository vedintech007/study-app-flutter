import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/firebase_ref/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    /// load json files
    final papersInAssets = manifestMap.keys
        .where(
          (path) =>
              path.startsWith(
                "assets/DB/paper",
              ) &&
              path.contains(".json"),
        )
        .toList();

    // print(papersInAssets);

    List<QuestionPaperModel> questionPapers = [];

    for (var paper in papersInAssets) {
      await rootBundle.loadString(paper).then(
            (value) => questionPapers.add(
              questionPaperModelFromJson(value),
            ),
            onError: (value) => print("Error adding paper $value"),
          );
    }

    for (var paper in questionPapers) {
      batch.set(questionPaperRf.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "time_seconds": paper.timeSeconds,
        "questions_count": paper.questions == null ? 0 : paper.questions!.length,
      });

      for (var questions in paper.questions!) {
        final questionpath = questionRF(paperId: paper.id!, questionid: questions.id!);

        batch.set(questionpath, {
          "question": questions.question,
          "correct_answer": getEnumValue(questions.correctAnswer),
        });

        for (var answer in questions.answers!) {
          print(answer.identifier);
          batch.set(questionpath.collection("answers").doc(getEnumValue(answer.identifier)), {
            "identifier": getEnumValue(answer.identifier),
            "answer": answer.answer,
          });
        }
      }
    }

    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
