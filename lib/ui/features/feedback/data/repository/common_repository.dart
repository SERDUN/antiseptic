import 'package:antisepticks/ui/features/feedback/data/models/request_deedback.dart';
import 'package:flutter/widgets.dart';

import '../datasource/api_client.dart';

class CommonRepository {
  final ApiClient api;
  CommonRepository({@required this.api}) : assert(api != null);
  Future<ResponseWrapper> postFeedback(FeedbackModel feedback) async {
    return await api.sendFeedback(feedback);
  }
}
