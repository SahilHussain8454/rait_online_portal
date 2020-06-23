import 'package:flutter/material.dart';
import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';

import 'package:rait_online_portal/constants.dart';

class StudentRegister extends StatefulWidget{
  @override
  _StudentRegisterState createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyAppBar(
        label: 'STUDENT SIGN IN',
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
                    fontWeight: FontWeight.bold,
                  ),
                  // style: kButtonTextStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  color: Colors.teal,
                  alignment: Alignment.centerLeft,
                  height: 60.0,
                  child: TextFormField(
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
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                    onSaved: (value) {
                      // _authData['email'] = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  // style: kButtonTextStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  color: Colors.teal,
                  alignment: Alignment.centerLeft,
                  height: 60.0,
                  child: TextFormField(
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
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Conform Password',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  // style: kButtonTextStyle,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  color: Colors.teal,
                  alignment: Alignment.centerLeft,
                  height: 60.0,
                  child: TextFormField(
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
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  // padding: EdgeInsets.all(10),
                  width: 120,
                  height: 50,
                  child: RaisedButton(
                    textColor: Colors.black,
                    color: Colors.teal,
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {},
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
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