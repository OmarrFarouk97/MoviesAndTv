import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/api_constance.dart';
import '../controller/movies_bloc.dart';
import '../controller/movies_state.dart';
import '../screens/movie_details_screen.dart';

class NowPlayingComponent extends StatelessWidget {
  const NowPlayingComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = MovieCubit.get(context);
          return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: (cubit.movieNowPlaying != null)
                  ? CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {},
                      ),
                      items: cubit.movieNowPlaying!.map(
                        (item) {
                          return GestureDetector(
                            key: const Key('openMovieMinimalDetail'),
                            onTap: () {
                              cubit.getMoviesDetails(item.id);
                              cubit.getRecommendationMovies(item.id);
                              Navigator.of(context).push( MaterialPageRoute(builder: (context) => MovieDetailContent(id: item.id)));
                            },
                            child: Stack(
                              children: [
                                ShaderMask(
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
                                      stops: [0, 0.3, 0.5, 1],
                                    ).createShader(
                                      Rect.fromLTRB(
                                          0, 0, rect.width, rect.height),
                                    );
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: CachedNetworkImage(
                                    height: 560.0,
                                    imageUrl: ApiConstance.imageUrl(
                                        item.backdropPath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.circle,
                                              color: Colors.redAccent,
                                              size: 16.0,
                                            ),
                                            const SizedBox(width: 4.0),
                                            Text(
                                              'Now Playing'.toUpperCase(),
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16.0),
                                        child: Text(
                                          item.title,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    )
                  : const SizedBox(
                      height: 400,
                      child: Center(child: CircularProgressIndicator()),
                    ));
        });
  }
}
