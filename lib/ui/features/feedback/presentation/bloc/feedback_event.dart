part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();
}

class PostFeedbackEvent extends FeedbackEvent {
  final String message;
  final String type;

  const PostFeedbackEvent({@required this.message, @required this.type})
      : assert(message != null && type != null);

  @override
  List<Object> get props => [message, type];
}
