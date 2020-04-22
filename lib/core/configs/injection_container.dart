import 'package:antisepticks/core/network/network_info.dart';
import 'package:antisepticks/ui/features/feedback/data/datasource/feedback_datasource.dart';
import 'package:antisepticks/ui/features/feedback/data/datasource/feedback_datasource_impl.dart';
import 'package:antisepticks/ui/features/feedback/data/repository/feedback_repository_impl.dart';
import 'package:antisepticks/ui/features/feedback/domain/repositories/feedback_repository.dart';
import 'package:antisepticks/ui/features/feedback/domain/usecases/post_feedback.dart';
import 'package:antisepticks/ui/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => FeedbackBloc(postFeedback: sl()));

  // Use cases
  sl.registerLazySingleton(() => PostFeedbackUseCase(sl()));

  // Repository
  sl.registerLazySingleton<FeedbackRepository>(
    () => FeedbackRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<FeedbackDataSource>(
    () => FeedbackDataSourceImpl(httpClient: sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
