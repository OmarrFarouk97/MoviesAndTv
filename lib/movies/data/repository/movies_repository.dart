import 'package:dartz/dartz.dart';
import 'package:movie/movies/domain/entities/movie_detailss.dart';
import 'package:movie/movies/domain/entities/recomndation.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/movies.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../datasource/movie_remote_data_source.dart';


class MoviesRepository extends BaseMoviesRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository(this.baseMovieRemoteDataSource);


  @override
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies()async {
final result=await baseMovieRemoteDataSource.getNowPlayingMovies();

try{
  return Right(result);
}on ServerException catch(failure){
  return Left(ServerFailure(failure.errorMessageModel.statusMessage));
}
  }

  @override
  Future<Either<Failure,List<Movie>>> getPopularMovies() async{
    final result=await baseMovieRemoteDataSource.getPopularMovies();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure,List<Movie>>>  getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMoviesDetails(int parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameters);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(int parameters) async {
    final result= await baseMovieRemoteDataSource.getRecommendation(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

}