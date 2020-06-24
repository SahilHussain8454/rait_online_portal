import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';
import 'package:rait_online_portal/constants.dart';
import 'package:rait_online_portal/providers/auth_faculty.dart';
import 'package:rait_online_portal/models/http_exception.dart';
import 'package:rait_online_portal/quiz_screen/student_quiz.dart';

enum AuthMode { Signup, Login }

class FacultyLogin extends StatefulWidget {
  @override
  _FacultyLoginState createState() => _FacultyLoginState();
}

class _FacultyLoginState extends State<FacultyLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<FacultyAuth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );  
      print("hello");
      }
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyAppBar(
        label: 'FACULTY LOGIN',
        containerContent: Container(
            child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Login',
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
                        else
                        return null;
                      },
                      onSaved: (value) {
                        _authData['email'] = value;
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
                      controller: _passwordController,
                      validator: (value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Password is too short!';
                        }
                        else
                        return null;
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
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
                  if (_isLoading)
                    CircularProgressIndicator()
                  else
                    Container(
                      // padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 100,
                      // child: RaisedButton(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonTheme(
                                height: 50,
                                minWidth: 100,
                                child: RaisedButton(
                                  textColor: Colors.black,
                                  color: Colors.teal,
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
                                  onPressed: (){
                                    _submit();
                                    Navigator.pushNamed(context, '/student_quiz');
                                  },
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                              ButtonTheme(
                                height: 50,
                                minWidth: 100,
                                child: RaisedButton(
                                  textColor: Colors.black,
                                  color: Colors.teal,
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
                                  onPressed: () {
                                    //UserType
                                    Navigator.pushNamed(
                                        context, '/faculty_register');
                                  },
                                  shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  // ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}

