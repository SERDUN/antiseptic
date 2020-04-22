import 'package:flutter/cupertino.dart';

class FeedbackEntity {
  static const String BUG = "bug_type";
  static const String IMPROVEMENT = "improvement_type";

  final String message;
  final String type;

  FeedbackEntity({@required this.message, @required this.type});
}
