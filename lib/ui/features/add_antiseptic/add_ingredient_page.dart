import 'package:antisepticks/ui/features/add_antiseptic/widgets/bottom_save_button.dart';
import 'package:antisepticks/ui/features/add_antiseptic/widgets/button_add_ingredient.dart';
import 'package:antisepticks/ui/painter/line_dashed_painer.dart';
import 'package:antisepticks/ui/style/decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'ingredient_model.dart';
import 'widgets/dialog_add_ingredient.dart';
import 'widgets/ingredient_list_item.dart';

class AddAntisepticPage extends StatefulWidget {
  @override
  _AddAntisepticPageState createState() => _AddAntisepticPageState();
}

class _AddAntisepticPageState extends State<AddAntisepticPage> {
  var _ingredientNameController = TextEditingController();
  var _ingredientCapacityController = TextEditingController();

  List<IngredientModel> list = [
    IngredientModel(name: "Test 1", ml: 100),
    IngredientModel(name: "Test 2", ml: 200)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomSaveButton(),
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
                    decoration: CustomDecoration.getDefaultInputDecoration(
                        hint: 'Please, enter your shor description.'))),
            ButtonAddIngredient(() {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext bc) {
                    return DialogAddIngredient(
                      onFinish: () {
                        var name = _ingredientNameController.text;
                        var ml =
                            double.parse(_ingredientCapacityController.text);

                        Navigator.pop(context);
                        setState(() {
                          list.add(IngredientModel(name: name, ml: ml));
                        });
                      },
                      ingredientCapacityController:
                          _ingredientCapacityController,
                      ingredientNameController: _ingredientNameController,
                    );
                  });
            }),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: CustomPaint(painter: LineDashedPainter()),
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, top: 16),
                  child: Text(
                    "Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Color(0xFF2699FB).withOpacity(0.6)),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 16, top: 16),
                    child: Text(
                      "Opacity",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(color: Color(0xFF2699FB).withOpacity(0.6)),
                    ))
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return IngredientListItem(list[index]);
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
