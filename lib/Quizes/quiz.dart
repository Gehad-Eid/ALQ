import 'dart:math';

import 'result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_view/quiz_view.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

enum HintItem { increaseTime, deleteAnswers }

class quiz_page extends StatelessWidget {
  final int chap;
  const quiz_page({required this.chap, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
