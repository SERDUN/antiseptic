import 'package:antisepticks/models/request/request_deedback.dart';
import 'package:flutter/widgets.dart';

import 'api_client.dart';

class CommonRepository {
  final ApiClient api;
  CommonRepository({@required this.api}) : assert(api != null);
  Future<ResponseWrapper> getWeather(FeedbackModel feedback) async {
    return await api.sendFeedback(feedback);
  }
}
