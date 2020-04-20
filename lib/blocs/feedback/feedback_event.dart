part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();
}

class PostFeedback extends FeedbackEvent {
  final FeedbackModel feedbackModel;

  const PostFeedback({@required this.feedbackModel})
      : assert(feedbackModel != null);

  @override
  List<Object> get props => [feedbackModel];
}
