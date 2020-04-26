import 'package:antisepticks/ui/clippers/oval_top_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomSaveButton extends StatefulWidget {
  @override
  _BottomSaveButtonState createState() => _BottomSaveButtonState();
}

class _BottomSaveButtonState extends State<BottomSaveButton> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //clipper: WaveClipperTwo(reverse: true),
      clipper: OvalTopClipper(),
      child: Container(
        height: 48,
        color: Colors.blue,
        child: Align(
          child: Container(
            child: Text(
              "Save",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
