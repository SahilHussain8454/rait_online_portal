import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rait_online_portal/components/scaffold_MyAppBar.dart';
import 'package:rait_online_portal/constants.dart';
import 'package:rait_online_portal/providers/auth.dart';
import 'package:rait_online_portal/models/http_exception.dart';

enum AuthMode { Signup, Login }

class StudentLogin extends StatefulWidget {
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
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
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );
        // Navigator.pushNamed(context, '/quiz_home');
      }
      print("Before Exception");
      // Navigator.pushNamed(context, '/quiz_home');
    } on HttpException catch (error) {
      print("inside exception");
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
      // Navigator.pushNamed(context, '/quiz_home');
    } catch (error) {
      print("inside catch");
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });

    print(Provider.of<Auth>(context, listen: false).isAuth);
    if (Provider.of<Auth>(context, listen: false).isAuth == true)
    {
      Navigator.pushNamed(context, '/student_quiz');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyAppBar(
        label: 'STUDENT LOGIN',
        containerContent: Container(
          child: Form(
              key: _formKey,
              child: Consumer<Auth>(
                builder: (ctx, auth, _) => Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 100.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          color: Colors.red[900],
                          alignment: Alignment.centerLeft,
                          height: 60.0,
                          child: TextFormField(
                            
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Username *',
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
                            validator:
                                // _validateEmail,
                                //EmailValidator.validate(),
                                (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              } else
                                return null;
                            },
                            onSaved: (value) {
                              // _validateInputs();
                              _authData['email'] = value;
                              // validemail = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          color: Colors.red[900],
                          alignment: Alignment.centerLeft,
                          height: 60.0,
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value) {
                              if (value.isEmpty || value.length < 5) {
                                return 'Password is too short!';
                              } else
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
                              labelText: 'Password',
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
                            height: 130,
                            child: Column(
                              
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height:60 ,),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ButtonTheme(
                                      height: 50,
                                      minWidth: 100,
                                      child: RaisedButton(
                                        textColor: Colors.black,
                                        color: Colors.blueAccent,
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 23,
                                          ),
                                        ),
                                        onPressed: () async {
                                          await _submit();
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
                                        color: Colors.blueAccent,
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                            fontSize: 23,
                                          ),
                                        ),
                                        onPressed: () {
                                          //UserType
                                          Navigator.pushNamed(
                                              context, '/student_register');
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
                        // ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
