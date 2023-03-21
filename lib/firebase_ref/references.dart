import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore = FirebaseFirestore.instance;

final questionPaperRf = fireStore.collection('questionPaper');

var batch = fireStore.batch();

DocumentReference questionRF({
  required String paperId,
  required String questionid,
}) =>
    questionPaperRf.doc(paperId).collection("questions").doc(questionid);
