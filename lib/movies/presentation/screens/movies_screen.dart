import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie/movies/presentation/controller/movies_state.dart';
import '../components/now_playing_component.dart';

import '../components/popular_component.dart';
import '../components/top_rated_component.dart';
import '../controller/movies_bloc.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit,MovieState>(
      listener: (context, state) {},
      builder:  (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            key: const Key('movieScrollView'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const  NowPlayingComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular",
                        style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white),
                      ),
                      InkWell(
                        onTap: () {
                          /// TODO : NAVIGATION TO POPULAR SCREEN
                        },
                        child: Row(
                          children: const [
                            Text(
                              'See More',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 5,),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const   PopularComponent(),
                Container(
                  margin: const EdgeInsets.fromLTRB(
                    16.0,
                    24.0,
                    16.0,
                    8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Rated",
                        style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white

                        ),
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Row(
                          children: const [
                            Text('See More',style: TextStyle(
                                color: Colors.white

                            ),),
                            SizedBox(width: 5,),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color:  Colors.white,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const    TopRatedComponent(),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        );
    },
    );
  }
}
