import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';
import 'package:rait_online_portal/constants.dart';
import 'package:rait_online_portal/components/gesture_Button.dart';

class UserType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      label: 'RAIT ONLINE PORTAL',
      containerContent: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Who\'s Accessing',
                style: kPageHeadingTextStyle,
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            GestureButton(
              label: 'STUDENT',
              onTap: () {
                Navigator.pushNamed(context, '/student_login');
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureButton(
              label: 'FACULTY',
              onTap: () {
                Navigator.pushNamed(context, '/faculty_login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
