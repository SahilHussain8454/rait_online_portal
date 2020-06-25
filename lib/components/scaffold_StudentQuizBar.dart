import 'package:flutter/material.dart';
import 'package:rait_online_portal/constants.dart';

import 'package:provider/provider.dart';
import 'package:rait_online_portal/providers/auth.dart';

class StudentQuizAppBar extends StatefulWidget {
  StudentQuizAppBar({@required this.label, @required this.containerContent});
  final String label;
  final Container containerContent;

  @override
  _StudentQuizAppBarState createState() => _StudentQuizAppBarState();
}

class _StudentQuizAppBarState extends State<StudentQuizAppBar> {
  final _isLoading = false;

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Are you sure you want to exit?'),
        actions: <Widget>[
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              // Navigator.of(ctx).pop();
              Navigator.pushNamed(context, '/student_login');
            },
          ),
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'images/RAIT_logo.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 35.0,
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.label,
                style: kAppBarTitleTextStyle,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: IconButton(
                  padding: EdgeInsets.all(40),
                  alignment: Alignment.topRight,
                  icon: Icon(
                    Icons.exit_to_app,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: _isLoading
                      ? CircularProgressIndicator()
                      : () {
                          _showAlertDialog();
                          print("logout");
                          Provider.of<Auth>(context, listen: false).logout();
                          // Navigator.pushNamed(context, '/user_type');
                          // Navigator.pushNamed(context, '/student_login');
                        },
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: widget.containerContent,
      ),
    );
  }
}
