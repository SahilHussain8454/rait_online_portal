import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';

class StudentQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyAppBar(
        label: 'QUIZ',
        containerContent: Container(
          child: Center(
            child: Text(
              'Quiz Home',
            ),
          ),
        ),
      ),
    );
  }
}
