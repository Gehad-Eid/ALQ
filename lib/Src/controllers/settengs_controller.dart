import 'package:alqgp/Src/Services/database_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettengsController extends GetxController {
  static SettengsController get instance => Get.find();

  final _databaseRepo = Get.put(DatabaseRepository());

  final title = TextEditingController();
  final problem = TextEditingController();

  // add a report in the db
  void reportAbug() {
    _databaseRepo.reportAbug(title.text, problem.text);
  }

  // add a report in the db
  void addFeedback() {
    _databaseRepo.addFeedback(title.text, problem.text);
  }
}
