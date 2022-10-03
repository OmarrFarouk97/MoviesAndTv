import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../data/datasource/movie_remote_data_source.dart';
import '../entities/movies.dart';

abstract class BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  BaseMoviesRepository(this.baseMovieRemoteDataSource);
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
}