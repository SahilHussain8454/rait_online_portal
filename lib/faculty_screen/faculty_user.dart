import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';
import 'package:rait_online_portal/components/gesture_Button.dart';
import 'package:rait_online_portal/constants.dart';

class Faculty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyAppBar(
      label: 'FACULTY PORTAL',
      containerContent: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Are U Registered ?',
                style: kPageHeadingTextStyle,
              ),
            ),
            SizedBox(
              height: 150.0,
            ),
            GestureButton(
              label: 'YES',
              onTap: () {
                Navigator.pushNamed(context, '/faculty_login');
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureButton(
              label: 'No',
              onTap: () {
                Navigator.pushNamed(context, '/faculty_register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
