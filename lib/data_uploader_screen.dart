import 'package:flutter/material.dart';
import 'package:flutter_study_app/controllers/questionl_paper/data_uploader.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});

  final dataUploader = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text(
            dataUploader.loadingStatus.value == LoadingStatus.loading ? "Uploading..." : "Data Uploaded Successfully!",
            style: TextStyle(
              color: dataUploader.loadingStatus.value == LoadingStatus.loading ? Colors.red : Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
