import 'dart:convert';
import 'dart:developer';

import 'package:antisepticks/models/request/request_deedback.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

import '../consts.dart';
import 'dto/feedback_response.dart';

class ApiClient {
  final Client httpClient;

  ApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<ResponseWrapper> sendFeedback(FeedbackModel feedback) async {
    if (feedback == null) {
      return null;
    }

    var queryParameters = {
      'message': feedback.message,
      'type': feedback.type,
    };

    var uri = Uri.https(Constants.BASE_URL_DOMAIN,
        Constants.ENDPOINT_ADD_FEEDBACK, queryParameters);

    log('request: ${uri.toString()}');

    var response = await httpClient.get(uri);

    log('response: ${response?.body}');

    if (response != null) {
      if (response.statusCode == 200) {
        var forecastResponse =
            FeedbackResponse.fromMap(json.decode(response.body));
        return ResponseWrapper<FeedbackResponse>(
            success: true, data: forecastResponse);
      } else {
        return ResponseWrapper(success: false, error: "Error");
      }
    } else {
      return ResponseWrapper(success: false, error: "Error");
    }
  }
}

class ResponseWrapper<T> {
  ResponseWrapper({bool success: false, String error, T data}) {
    this.success = success;
    this.error = error;
    this.data = data;
  }

  bool success;
  String error;
  T data;
}
