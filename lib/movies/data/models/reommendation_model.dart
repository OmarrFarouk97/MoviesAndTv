import '../../domain/entities/recomndation.dart';

class RecommendationModel extends Recommendation{

  const RecommendationModel({  super.backdropPath,required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json)=>
      RecommendationModel(
        backdropPath:json['backdrop_path'] ??'/rSPw7tgCH9c6NqICZef4kZjFOQ5.jpg',
        id:json['id'],
      );
}