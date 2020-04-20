import 'package:flutter/cupertino.dart';

class FeedbackModel {
  static const String BUG = "bug_type";
  static const String IMPROVEMENT = "improvement_type";

  final String message;
  final String type;

  FeedbackModel({@required this.message, @required this.type});
}
