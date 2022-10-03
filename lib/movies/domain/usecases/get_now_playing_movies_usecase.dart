import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/movies.dart';
import '../repository/base_movies_repository.dart';


class GetNowPlayingMoviesUseCase{
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Failure,List<Movie>>> execute()async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}