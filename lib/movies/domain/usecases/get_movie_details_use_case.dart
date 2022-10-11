import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usec_case.dart';
import 'package:movie/movies/domain/entities/movie_detailss.dart';
import 'package:movie/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, int > {
 final BaseMoviesRepository baseMoviesRepository ;

 GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call( int parameters)async {
    return await baseMoviesRepository.getMoviesDetails( parameters);

  }

}