import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';

class FacultyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyAppBar(
        label: 'FACULTY LOGIN',
        containerContent: Container(
          child: Text(
            'Faculty Login',
          ),
        ),
      ),
    );
  }
}
