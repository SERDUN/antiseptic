part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackState {}

class InitialFeedbackState extends FeedbackState {}

class PostingState extends FeedbackState {}

class PostedState extends FeedbackState {}

class PostErrorState extends FeedbackState {}
