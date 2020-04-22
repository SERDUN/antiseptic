import 'dart:async';

import 'package:antisepticks/ui/features/feedback/domain/usecases/post_feedback.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  PostFeedbackUseCase postFeedback;

  FeedbackBloc({@required this.postFeedback}) : assert(postFeedback != null);

  @override
  FeedbackState get initialState => InitialFeedbackState();

  @override
  Stream<FeedbackState> mapEventToState(FeedbackEvent event) async* {
    if (event is PostFeedbackEvent) {
      yield PostingState();

      final failureOrFeedbackStatus =
          await postFeedback(Params(message: event.message, type: event.type));

      if (failureOrFeedbackStatus.isRight) {
        yield PostedState();
      }
      if (failureOrFeedbackStatus.isLeft) {
        yield PostErrorState();
      }
    }
  }
}
