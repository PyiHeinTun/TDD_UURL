import 'package:get_it/get_it.dart';

import 'core/platform/network_info.dart';
import 'features/extractAllUrl/data/reposistory/url_repository_impl.dart';
import 'features/extractAllUrl/data/source/facebook_source.dart';
import 'features/extractAllUrl/data/source/streamtape_source.dart';
import 'features/extractAllUrl/domain/repository/url_repository.dart';
import 'features/extractAllUrl/domain/useCase/get_extract_url.dart';
import 'features/extractAllUrl/presentation/bloc/extractallurl_bloc.dart';

final sl = GetIt.instance;

Future<void> extractorinit() async {
  //Bloc
  sl.registerFactory<ExtractallurlBloc>(
    () => ExtractallurlBloc(getExtractUrlImpl: sl<GetExtractUrl>()),
  );

  // Use cases
  sl.registerLazySingleton<GetExtractUrl>(
    () => GetExtractUrl(repository: sl()),
  );

  // Repository
  sl.registerLazySingleton<UrlRepository>(
    () => UrlRepositoryImpl(
      facebookSource: sl(),
      streamtapeSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Data
  sl.registerLazySingleton<FacebookSource>(() => FacebookSourceImpl());
  sl.registerLazySingleton<StreamtapeSource>(() => StreamtapeSourceImpl());

  //Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //External
}
