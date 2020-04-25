import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddIngredientDialog extends StatelessWidget {
  final Function onResult;

  const AddIngredientDialog({
    Key key,
    this.onResult,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
        child: showDialog(context),
      ),
    );
  }

  Widget showDialog(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 32, right: 32, top: 24),
      child: new Wrap(
        children: <Widget>[
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              child: Text(
                "Short Description",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF2699FB)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                child: TextField(
                  decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      hintText: 'Please, enter your shor description.',
                      hintStyle:
                          TextStyle(color: Colors.blue.withOpacity(0.5))),
                )),
            Container(
              child: Text(
                "Сapacity",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF2699FB)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 16, bottom: 16),
                child: TextField(
                  decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      hintText: 'What volume does this ingredient occupy.',
                      hintStyle:
                          TextStyle(color: Colors.blue.withOpacity(0.5))),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 48,
                height: 48,
                child: Icon(
                  Icons.check,
                  size: 20,
                  color: Colors.blue,
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.1)),
              ),
            ),
            SizedBox(
              height: 16,
            )
          ])
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 16.0,
            offset: new Offset(0.0, -1),
          ),
        ],
      ),
    );
  }
}
