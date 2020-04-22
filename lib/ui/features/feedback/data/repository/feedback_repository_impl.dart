import 'package:antisepticks/core/error/exceptions.dart';
import 'package:antisepticks/core/error/failures.dart';
import 'package:antisepticks/core/network/network_info.dart';
import 'package:antisepticks/core/util/either.dart';
import 'package:antisepticks/ui/features/feedback/data/datasource/feedback_datasource.dart';
import 'package:antisepticks/ui/features/feedback/data/models/status_response.dart';
import 'package:antisepticks/ui/features/feedback/domain/repositories/feedback_repository.dart';
import 'package:meta/meta.dart';

class FeedbackRepositoryImpl implements FeedbackRepository {
  final FeedbackDataSource remoteDataSource;

  // final  localDataSource;
  final NetworkInfo networkInfo;

  FeedbackRepositoryImpl({
    @required this.remoteDataSource,
//    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, StatusResponse>> postFeedback(
      String text, String type) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia = await remoteDataSource.postFeedback(text, type);

        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }
}
