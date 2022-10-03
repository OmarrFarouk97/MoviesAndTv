
import 'package:get_it/get_it.dart';
import '../../movies/data/datasource/movie_remote_data_source.dart';
import '../../movies/data/repository/movies_repository.dart';
import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_now_playing_movies_usecase.dart';
import '../../movies/domain/usecases/get_popular_movies_usecase.dart';
import '../../movies/domain/usecases/get_top_rated_movies_usecase.dart';
import '../../movies/presentation/controller/movies_bloc.dart';

final sl=GetIt.instance;
class ServiceLocator{
  void init(){

///bloc
sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    /// Use Case
sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}