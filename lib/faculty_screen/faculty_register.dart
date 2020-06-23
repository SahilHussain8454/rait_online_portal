import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';

class FacultyRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyAppBar(
        label: 'FACULTY REGISTER',
        containerContent: Container(
          child: Text(
            'Faculty Register',
          ),
        ),
      ),
    );
  }
}
