import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_FacultyQuizBar.dart';

class FacultyQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FacultyQuizAppBar(
        label: 'ONLINE QUIZ',
        containerContent: Container(
          child: Center(
            child: Text(
              'Student Quiz',
            ),
          ),
        ),
      ),
    );
  }
}
