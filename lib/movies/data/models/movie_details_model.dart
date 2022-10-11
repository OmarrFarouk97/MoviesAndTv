import 'package:movie/movies/data/models/geners_model.dart';
import 'package:movie/movies/domain/entities/movie_detailss.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.voteAverage,
      required super.genres});

  factory MovieDetailsModel.fromJson(Map<String,dynamic > json )=> MovieDetailsModel(
backdropPath: json["backdrop_path"],
id: json["id"],
overview: json["overview"],
releaseDate: json["release_date"],
runtime: json["runtime"],
title: json["title"],
voteAverage: json["vote_average"].toDouble(),
genres: List<GenresModel>.from(json["genres"].map((x)=> GenresModel.fromJson(x)))
);
}
