
import 'package:get_it/get_it.dart';
import 'package:movie/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie/movies/domain/usecases/get_recommendation_use_case.dart';
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
sl.registerFactory(() => MovieCubit(sl(),sl(),sl(),sl(),sl()),);
    /// Use Case
sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));
sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));
    /// Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}