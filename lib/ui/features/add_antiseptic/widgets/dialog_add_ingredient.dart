import 'dart:ui';

import 'package:antisepticks/ui/style/decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DialogAddIngredient extends StatelessWidget {
  final Function() onFinish;

  final TextEditingController ingredientNameController;
  final TextEditingController ingredientCapacityController;

  const DialogAddIngredient({
    Key key,
    this.onFinish,
    @required this.ingredientNameController,
    @required this.ingredientCapacityController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
        child: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: showDialog(context))),
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
                    controller: ingredientNameController,
                    decoration: CustomDecoration.getDefaultInputDecoration(
                        hint: "Please, enter your shor description."))),
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
                    controller: ingredientCapacityController,
                    decoration: CustomDecoration.getDefaultInputDecoration(
                        hint: "What volume does this ingredient occupy."))),
            GestureDetector(
              child: Align(
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
              onTap: () {
                onFinish();
              },
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
