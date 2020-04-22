import 'package:antisepticks/core/error/failures.dart';
import 'package:antisepticks/core/util/either.dart';
import 'package:antisepticks/ui/features/feedback/data/models/status_response.dart';

abstract class FeedbackRepository {
  Future<Either<Failure, StatusResponse>> postFeedback(
      String text, String type);
}
