import 'package:antisepticks/core/error/failures.dart';
import 'package:antisepticks/core/usecase/usecase.dart';
import 'package:antisepticks/core/util/either.dart';
import 'package:antisepticks/ui/features/feedback/data/models/status_response.dart';
import 'package:antisepticks/ui/features/feedback/domain/repositories/feedback_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PostFeedbackUseCase implements UseCase<StatusResponse, Params> {
  final FeedbackRepository repository;

  PostFeedbackUseCase(this.repository);

  @override
  Future<Either<Failure, StatusResponse>> call(Params params) async {
    return await repository.postFeedback(params.message, params.type);
  }
}

class Params extends Equatable {
  final String type;
  final String message;

  Params({@required this.type, @required this.message});

  @override
  List<Object> get props => [type, message];
}
