import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';
import 'package:rait_online_portal/constants.dart';

class StudentLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyAppBar(
        label: 'STUDENT LOGIN',
        containerContent: Container(
            child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sign In',
              style: kPageHeadingTextStyle,
            ),
            SizedBox(
              height: 100.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  // style: kButtonTextStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    bottom: 20.0,
                  ),
                  color: Colors.teal,
                  alignment: Alignment.centerLeft,
                  height: 60.0,
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        top: 14.0,
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                  // style: kButtonTextStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  color: Colors.teal,
                  alignment: Alignment.centerLeft,
                  height: 60.0,
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        top: 14.0,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
