import 'package:dartz/dartz.dart';
import 'package:movie/movies/domain/entities/movie_detailss.dart';
import '../../../core/error/failure.dart';
import '../../data/datasource/movie_remote_data_source.dart';
import '../entities/movies.dart';
import '../entities/recomndation.dart';
import '../usecases/get_recommendation_use_case.dart';

// l method htkon future 3shan request ll api 3shan ngeb mno l data
// future list ht return movie dah l entitie bt3e
// dah l contract


abstract class BaseMoviesRepository{

  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();



  Future<Either<Failure,MovieDetail>> getMoviesDetails( int parameters);


  Future<Either<Failure, List<Recommendation>>> getRecommendation(int parameters);




}