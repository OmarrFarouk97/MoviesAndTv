import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/movies/presentation/controller/movies_bloc.dart';
import 'package:movie/movies/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/network/api_constance.dart';
import '../../../core/utils/app_string.dart';

class MovieDetailContent extends StatelessWidget {
  final int id;

  const MovieDetailContent({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = MovieCubit.get(context);

        return Scaffold(
            body: (cubit.movieDetail != null)
                ? CustomScrollView(
                    key: const Key('movieDetailScrollView'),
                    slivers: [
                      SliverAppBar(
                        backgroundColor: Colors.transparent,
                        pinned: false,
                        expandedHeight: 250.0,
                        flexibleSpace: FlexibleSpaceBar(
                          background: FadeIn(
                              duration: const Duration(milliseconds: 500),
                              child:  ShaderMask(
                                      shaderCallback: (rect) {
                                        return const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black,
                                            Colors.black,
                                            Colors.transparent,
                                          ],
                                          stops: [0.0, 0.5, 1.0, 1.0],
                                        ).createShader(
                                          Rect.fromLTRB(0.0, 0.0, rect.width,
                                              rect.height),
                                        );
                                      },
                                      blendMode: BlendMode.dstIn,
                                      child: CachedNetworkImage(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        imageUrl: ApiConstance.imageUrl(
                                            cubit.movieDetail!.backdropPath),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: FadeInUp(
                            from: 20,
                            duration: const Duration(milliseconds: 500),
                            child:  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(cubit.movieDetail!.title,
                                            style: GoogleFonts.poppins(
                                              fontSize: 23,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.2,
                                              color: Colors.white
                                            )),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 2.0,
                                                horizontal: 8.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.grey[800],
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Text(
                                                cubit.movieDetail!.releaseDate
                                                    .split('-')[0],
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 20.0,
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  (cubit.movieDetail!
                                                              .voteAverage /
                                                          2)
                                                      .toStringAsFixed(1),
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                  ),
                                                ),
                                                const SizedBox(width: 4.0),
                                                Text(
                                                  '(${cubit.movieDetail!.voteAverage})',
                                                  style: const TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    letterSpacing: 1.2,
                                                    color: Colors.white,

                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 16.0),
                                            Text(
                                              _showDuration(
                                                  cubit.movieDetail!.runtime),
                                              style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1.2,

                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20.0),
                                        Text(
                                          cubit.movieDetail!.overview,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1.2,
                                            color: Colors.white,

                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        SizedBox(
                                          height: 30,
                                          child: ListView.separated(
                                            padding: const EdgeInsets.symmetric(horizontal: 2),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context,index){
                                              return Container(
                                                color: Colors.grey.withOpacity(0.1),
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: Center(
                                                  child: Text(


                                                    cubit.movieDetail!.genres[index].name,
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                    ),

                                                  ),
                                                ),
                                              );
                                            },
                                            itemCount: cubit.movieDetail!.genres.length,
                                            separatorBuilder: (context,state)=>const SizedBox(width: 10,),
                                          ),
                                        ),


                                        // Text(
                                        //   '${AppString.genres}: ${_showGenres(cubit.movieDetail!.genres)}',
                                        //   style: const TextStyle(
                                        //     color: Colors.white60,
                                        //     fontSize: 16.0,
                                        //     fontWeight: FontWeight.bold,
                                        //     letterSpacing: 1.2,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  )
                                ),
                      ),
                      SliverPadding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                        sliver: SliverToBoxAdapter(
                          child: FadeInUp(
                              from: 20,
                              duration: const Duration(milliseconds: 500),
                              child: const Text(
                                      AppString.moreLikeThis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                        color: Colors.white,

                                      ),
                                    ),)

                        ),
                      ),
                      SliverPadding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 0.0, 16.0, 24.0),
                              sliver: _showRecommendations()
                      ),
                    ],
                  )
                : const SizedBox(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ));
      },
    );
  }

  // String _showGenres(List<Genres> genres) {
  //   String result = '';
  //   for (var genre in genres) {
  //     result += '${genre.name}, ';
  //   }
  //
  //   if (result.isEmpty) {
  //     return result;
  //   }
  //
  //   return result.substring(0, result.length - 2);
  // }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations() {
    return BlocConsumer<MovieCubit, MovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MovieCubit.get(context);

          return
            (cubit.recommendation != null)
                ? SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final recommendation = cubit.recommendation![index];
                return InkWell(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      child: CachedNetworkImage(
                        imageUrl: ApiConstance.imageUrl(recommendation.backdropPath!),
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey[850]!,
                          highlightColor: Colors.grey[800]!,
                          child: Container(
                            height: 170.0,
                            width: 120.0,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        height: 180.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: (){
                    cubit.getMoviesDetails(cubit.recommendation![index].id);
                    cubit.getRecommendationMovies(cubit.recommendation![index].id);
                    Navigator.of(context).push( MaterialPageRoute(builder: (context) => MovieDetailContent(id:cubit.recommendation![index].id)));

                  },
                );
              },
              childCount: cubit.recommendation!.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7,
              crossAxisCount: 3,
            ),
          )
                : const SizedBox(child: Center(child: CircularProgressIndicator(),

          ),
          );
        });
  }
}
