import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonAddIngredient extends StatelessWidget {
  final Function onTap;

  ButtonAddIngredient(this.onTap);

  @override
  Widget build(BuildContext context) {
    return addIngredient();
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
                      style:
                          TextStyle(color: Color(0xFF2699FB).withOpacity(0.5)),
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
        onTap: onTap);
  }
}
