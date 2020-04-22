import 'package:antisepticks/ui/features/feedback/data/models/status_response.dart';

abstract class FeedbackDataSource {
  Future<StatusResponse> postFeedback(String text, String type);
}
