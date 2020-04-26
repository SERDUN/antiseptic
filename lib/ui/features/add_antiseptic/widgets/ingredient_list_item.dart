import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../ingredient_model.dart';

class IngredientListItem extends StatelessWidget {
  IngredientModel ingredient;

  IngredientListItem(this.ingredient);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          margin: EdgeInsets.only(top: 8, right: 32, left: 8),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(ingredient.name),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          child: Container(
            margin: EdgeInsets.only(top: 24, right: 16),
            child: Container(
              width: 48,
              height: 48,
              child: Center(
                child: Text(
                  ingredient.ml.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            ),
          ),
          alignment: Alignment.centerRight,
        )
      ],
    );
  }
}
