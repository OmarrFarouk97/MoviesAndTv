import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../../../core/usec_case.dart';
import '../entities/movies.dart';
import '../repository/base_movies_repository.dart';

// hena na b3ml l method eli htnadi 3ala l function bta3te l base repositry
class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure,List<Movie>>> call( NoParameters parameters)async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}