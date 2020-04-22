import 'dart:developer';

import 'package:antisepticks/core/configs/consts.dart';
import 'package:antisepticks/core/error/exceptions.dart';
import 'package:antisepticks/ui/features/feedback/data/models/status_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'feedback_datasource.dart';

class FeedbackDataSourceImpl extends FeedbackDataSource {
  final Dio httpClient;

  FeedbackDataSourceImpl({@required this.httpClient})
      : assert(httpClient != null);

  @override
  Future<StatusResponse> postFeedback(String text, String type) async {
    var body = {
      'message': text,
      'type': type,
    };
    var uri =
        Uri.https(Constants.BASE_URL_DOMAIN, Constants.ENDPOINT_ADD_FEEDBACK);
    log('request: ${uri.toString()}');

    final response = await httpClient.post(uri.toString(), data: body);

    if (response.statusCode == 200) {
      return StatusResponse.fromMap(response.extra);
    } else {
      throw ServerException();
    }
  }
}
