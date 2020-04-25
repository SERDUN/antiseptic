import 'package:antisepticks/ui/clippers/diagonal_path_clepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'confirmation_dialog_shower.dart';

class AddAntisepticPage extends StatefulWidget {
  @override
  _AddAntisepticPageState createState() => _AddAntisepticPageState();
}

class _AddAntisepticPageState extends State<AddAntisepticPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipPath(
        clipper: DiagonalPathClipperOne(),
        child: Container(
          height: 48,
          color: Colors.blue,
          child: Align(
            child: Container(
              margin: EdgeInsets.only(left: 24),
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text("Add antisptic"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () {
              // Navigator.pushNamed(context, RoutesPath.ANTISEPTIC_ADD);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.all(24),
              width: double.infinity,
              child: Text(
                "0 ML",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Color(0xFF2699FB)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
              child: Text(
                "Short Description",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xFF2699FB)),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 16, right: 16),
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
            addIngredient()
          ]),
        ),
      ),
    );
  }

  GestureDetector addIngredient() {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 32),
        padding: EdgeInsets.only(left: 16, right: 16),
        height: 80,
        width: double.infinity,
        color: Color(0xFFF1F9FF),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Add ingredient",
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Color(0xFF2699FB)),
                    ),
                    margin: EdgeInsets.only(bottom: 8, top: 8),
                  ),
                  Text(
                    "Додайте тут елемент для приготування антисептику",
                    style: TextStyle(color: Color(0xFF2699FB).withOpacity(0.5)),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.only(right: 8),
                child: Icon(Icons.add, color: Colors.blue),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (BuildContext bc) {
              return SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddIngredientDialog(
                        onResult: () {
                          Navigator.pop(context);
                          setState(() {});
                        },
                      )));
            });
      },
    );
  }
}
