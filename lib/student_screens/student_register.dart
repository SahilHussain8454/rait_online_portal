import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';

class StudentRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyAppBar(
        label: 'STUDENT REGISTER',
        containerContent: Container(
          child: Text(
            'Student Register',
          ),
        ),
      ),
    );
  }
}
