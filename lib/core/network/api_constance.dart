class ApiConstance{
  static const String baseUrl="https://api.themoviedb.org/3";
  static const String apiKey="801d494b747620abff8da2932a019c4e";
  static const String nowPlayingMoviesPath="$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviePath="$baseUrl/movie/popular?api_key=$apiKey";


  static  String movieDetailsPatch (int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  static String recommendationPath(movieId)=>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";


  static const String topRatedMoviePath="https://api.themoviedb.org/3/movie/top_rated?api_key=801d494b747620abff8da2932a019c4e";
  static const String baseImageUrl="https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path)=>'$baseImageUrl$path';
}