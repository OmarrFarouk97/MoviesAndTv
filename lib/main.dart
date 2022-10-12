import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movies/presentation/controller/movies_bloc.dart';

import 'core/services/services_locator.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main()async {
  ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieCubit(sl(),sl(),sl(),sl(),sl())..getNowPlayingMovies()..getPopularMovies()..getTopRatedMovies(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,

        theme:ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.grey.shade900,),
        home:const MoviesScreen(),
      ),
    );
  }
}


