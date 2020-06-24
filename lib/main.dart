import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common_screen/user_type.dart';
import 'package:rait_online_portal/student_screens/student_user.dart';
import 'student_screens/student_login.dart';
import 'student_screens/student_register.dart';
import 'package:rait_online_portal/faculty_screen/faculty_user.dart';
import 'faculty_screen/faculty_login.dart';
import 'faculty_screen/faculty_register.dart';
import './providers/auth.dart';
import './providers/auth_faculty.dart';
import 'package:rait_online_portal/quiz_screen/student_quiz.dart';
void main() => runApp(RaitOnline());

class RaitOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: FacultyAuth(),
        ),
      ],
    child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => UserType(),
          '/user_type': (context) => UserType(),
          '/user_student': (context) => Student(),
          '/user_faculty': (context) => Faculty(),
          '/student_login': (context) => StudentLogin(),
          '/student_register': (context) => StudentRegister(),
          '/faculty_login': (context) => FacultyLogin(),
          '/faculty_register': (context) => FacultyRegister(),
          '/student_quiz': (context) => StudentQuiz(),
        },
      ),
    );
  }
}
