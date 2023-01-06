import 'package:anime_hi/data/datasource/remote/remote_datasource_impl.dart';
import 'package:anime_hi/data/repository/repository.dart';
import 'package:anime_hi/domain/usecase/fetch_anime_info.dart';
import 'package:anime_hi/domain/usecase/fetch_top_airing_anime.dart';
import 'package:anime_hi/presentation/state_management/info/info_bloc.dart';
import 'package:anime_hi/presentation/state_management/top_airing/top_airing_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/remote/remote_datasource.dart';
import 'domain/repository/repository.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => TopAiringBloc(fetchTopAiringAnime: sl()));
  sl.registerFactory(() => InfoBloc(sl()));

  sl.registerLazySingleton(() => FetchTopAiringAnime(repo: sl()));
  sl.registerLazySingleton(() => FetchAnimeInfo(repo: sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(remote: sl()));

  sl.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl());
}
