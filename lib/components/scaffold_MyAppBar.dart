import 'package:flutter/material.dart';
import 'package:rait_online_portal/constants.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({@required this.label, @required this.containerContent});
  final String label;
  final Container containerContent;
  final _isLoading = false;

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
                label,
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
                    Icons.home,
                    size: 30,
                    color: Colors.black,
                  ),
                  onPressed: _isLoading
                      ? CircularProgressIndicator()
                      : () {
                          print("home");
                          Navigator.pushNamed(context, '/user_type');
                        },
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: containerContent,
      ),
    );
  }
}
