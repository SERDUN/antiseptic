import 'dart:async';

import 'package:antisepticks/models/request/request_deedback.dart';
import 'package:antisepticks/repository/api_client.dart';
import 'package:antisepticks/repository/common_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final CommonRepository commonRepository;

  FeedbackBloc({@required this.commonRepository})
      : assert(commonRepository != null);

  @override
  FeedbackState get initialState => InitialFeedbackState();

  @override
  Stream<FeedbackState> mapEventToState(FeedbackEvent event) async* {
    if (event is PostFeedback) {
      yield PostingState();

      try {
        final ResponseWrapper response = await commonRepository.getWeather(
            FeedbackModel(message: "My feedback", type: "bug_type"));

        yield PostedState();
      } catch (e) {
        yield PostErrorState();
      }
    }
  }
}
