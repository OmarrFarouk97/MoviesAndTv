
abstract class MovieState {}

class MovieInitial extends MovieState {}

class GetMoviesLoadingState extends MovieState{}
class GetMoviesErrorState extends MovieState{}
class GetMoviesSuccessState extends MovieState{}

class GetPopularMoviesLoadingState extends MovieState{}
class GetPopularMoviesErrorState extends MovieState{}
class GetPopularMoviesSuccessState extends MovieState{}



class GetTopRatedMoviesLoadingState extends MovieState{}
class GetTopRatedMoviesErrorState extends MovieState{}
class GetTopRatedMoviesSuccessState extends MovieState{}



class GetMoviesDetailsLoadingState extends MovieState{}
class GetMoviesDetailsErrorState extends MovieState{}
class GetMoviesDetailsSuccessState extends MovieState{}


class GetRecommendationMoviesDetailsLoadingState extends MovieState{}
class GetRecommendationMoviesDetailsErrorState extends MovieState{}
class GetRecommendationMoviesDetailsSuccessState extends MovieState{}



