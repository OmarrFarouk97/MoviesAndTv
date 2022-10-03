
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usec_case.dart';
import '../entities/movies.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movie>>> call( NoParameters parameters)async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}