import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Text(
                "Antiseptics",
                style: Theme.of(context).textTheme.headline,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna wirl aliqua. Ut enim ad minim ikad veniam, quis nostrud exercitatn ullamco laboris nisinuli.",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(
                color: Color(0xFF717171).withAlpha(50),
              ),
            ),
            SizedBox(
              height: 32,
            ),
            ButtonTheme(
                minWidth: 300,
                child: RaisedButton(
                  textColor: Colors.white,
                  child: Text("Antiseptics"),
                  onPressed: () {},
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 142,
                  child: RaisedButton(
                    textColor: Colors.white,
                    child: Text("Settings"),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                ButtonTheme(
                    minWidth: 142,
                    child: RaisedButton(
                      textColor: Colors.white,
                      child: Text("Fedback"),
                      onPressed: () {},
                    )),
              ],
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(
                          left: 16, right: 16, top: 8, bottom: 16),
                      child: Text(
                        "Terms & Conditions",
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.underline,
                            color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
