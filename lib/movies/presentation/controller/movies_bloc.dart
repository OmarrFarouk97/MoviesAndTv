import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/usec_case.dart';
import 'package:movie/movies/domain/entities/movie_detailss.dart';
import 'package:movie/movies/domain/entities/recomndation.dart';
import 'package:movie/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:movie/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movie/movies/domain/usecases/get_recommendation_use_case.dart';

import '../../../core/error/failure.dart';
import '../../domain/entities/movies.dart';
import '../../domain/usecases/get_popular_movies_usecase.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';
import 'movies_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase, this.getMovieDetailsUseCase, this.getRecommendationUseCase) : super(MovieInitial());

  static MovieCubit get(context) => BlocProvider.of(context);


  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetail? movieDetail;
  List<Movie>?  movieNowPlaying;
  List<Movie>?  moviePopular;
  List<Movie>?  movieTopRated;

  List<Recommendation>? recommendation;




  Future<Either<Failure,List<Movie>>> getNowPlayingMovies() async {
    emit(GetMoviesLoadingState());
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold((l) {
      ServerFailure(l.message);
      emit(GetMoviesErrorState());
    }, (r) {
      movieNowPlaying = r ;
      print(r);
      emit(GetMoviesSuccessState());
    });
    return result;
  }

  Future<Either<Failure,List<Movie>>> getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    final result = await getPopularMoviesUseCase(const NoParameters());
    result.fold((l) {
      ServerFailure(l.message);
      emit(GetPopularMoviesErrorState());
    }, (r) {
      moviePopular = r ;
      print(r);
      emit(GetPopularMoviesSuccessState());
    });
    return result;
  }

  Future<Either<Failure,List<Movie>>> getTopRatedMovies() async {
    emit(GetTopRatedMoviesLoadingState());
    final result = await getTopRatedMoviesUseCase(const NoParameters());
    result.fold((l) {
      ServerFailure(l.message);
      emit(GetTopRatedMoviesErrorState());
    }, (r) {
      movieTopRated = r ;
      print(r);
      emit(GetTopRatedMoviesSuccessState());
    });
    return result;
  }

  Future<Either<Failure,MovieDetail>> getMoviesDetails(int parameters ) async {
    emit(GetMoviesDetailsLoadingState());
    final result = await getMovieDetailsUseCase(parameters);
    result.fold((l) {
      ServerFailure(l.message);
      emit(GetMoviesDetailsErrorState());
    }, (r) {
      movieDetail = r ;
      print(r);
      emit(GetMoviesDetailsSuccessState());
    });
    return result;
  }


  Future<Either<Failure,List<Recommendation>>> getRecommendationMovies(int parameters) async {
    emit(GetRecommendationMoviesDetailsLoadingState());
    final result = await getRecommendationUseCase(parameters);
    result.fold((l) {
      ServerFailure(l.message);
      emit(GetRecommendationMoviesDetailsErrorState());
    }, (r) {
      recommendation = r ;
      print(r);
      emit(GetRecommendationMoviesDetailsSuccessState());
    });
    return result;
  }











}
