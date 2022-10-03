import 'package:dio/dio.dart';
import 'package:movie/movies/data/models/movie_details_model.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_recommendation_use_case.dart';
import '../models/movie_model.dart';
import '../models/reommendation_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(int parameters);
  Future<List<RecommendationModel>> getRecommendation(
      int parameters);


}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)

          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int parameters)async {
    final response = await Dio().get(ApiConstance.movieDetailsPatch(parameters));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
}



  @override
  Future<List<RecommendationModel>> getRecommendation(
      int parameters) async {
    final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/$parameters/recommendations?api_key=c1f3631998bff8601995649df39daaf2&language=en-US');
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
