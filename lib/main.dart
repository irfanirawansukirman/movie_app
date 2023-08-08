import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_movie_app/core/app_route_path.dart';
import 'package:mvvm_movie_app/core/environment_config.dart';
import 'package:mvvm_movie_app/presentation/about/about_screen.dart';
import 'package:mvvm_movie_app/presentation/home/home_screen.dart';
import 'package:mvvm_movie_app/presentation/home/now_playing/now_playing_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/popular/popular_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/top_rated/top_rated_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/up_coming/up_coming_cubit.dart';

import 'injector.dart' as inject;

void main() {
  setEnvironment(Environment.development);

  WidgetsFlutterBinding.ensureInitialized();

  inject.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => inject.locator<NowPlayingCubit>()),
        BlocProvider(create: (_) => inject.locator<PopularCubit>()),
        BlocProvider(create: (_) => inject.locator<TopRatedCubit>()),
        BlocProvider(create: (_) => inject.locator<UpComingCubit>()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // set app to always dark mode
        // source: https://stackoverflow.com/a/67714404
        theme: ThemeData.dark(),
        home: const HomeScreen(),
        initialRoute: AppRoutePath.home,
        onGenerateRoute: (route) {
          switch (route.name) {
            // case AppRoutePath.movieDetail:
            //   {
            //     final params = route.arguments as Map;
            //     return MaterialPageRoute(
            //       builder: (_) => MovieDetailScreen(
            //         id: int.parse(
            //           params["id"].toString(),
            //         ),
            //       ),
            //     );
            //   }
            case AppRoutePath.about:
              {
                return MaterialPageRoute(
                  builder: (_) => const AboutScreen(),
                );
              }
            default:
              {
                return MaterialPageRoute(
                  builder: (_) => const Center(
                    child: Text("Halaman tidak ditemukan"),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
