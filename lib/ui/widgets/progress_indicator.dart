import 'package:flutter/material.dart';

class DefaultProgressIndicator extends StatelessWidget {
  final bool isVisible;
  final Color background;

  final double size;

  const DefaultProgressIndicator(
      {Key key,
      this.background = Colors.transparent,
      this.size,
      this.isVisible = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        color: background,
        child: Visibility(
          visible: isVisible,
          child: Center(
              child: CircularProgressIndicator(
            strokeWidth: 1.5,
          )),
        ),
      );
}
