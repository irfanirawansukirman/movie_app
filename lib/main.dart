import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/core/app_route_path.dart';
import 'package:mvvm_movie_app/core/environment_config.dart';
import 'package:mvvm_movie_app/presentation/home/home_screen.dart';
import 'package:mvvm_movie_app/presentation/movie_detail/movie_detail_screen.dart';

import 'injector.dart' as inject;

void main() {
  setEnvironment(Environment.dev);
  WidgetsFlutterBinding.ensureInitialized();

  inject.initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      initialRoute: AppRoutePath.home,
      onGenerateRoute: (route) {
        switch (route.name) {
          case AppRoutePath.movieDetail:
            {
              final params = route.arguments as Map;
              return MaterialPageRoute(
                builder: (_) => MovieDetailScreen(
                  id: int.parse(
                    params["id"].toString(),
                  ),
                ),
              );
            }
          default:
            {
              return MaterialPageRoute(
                builder: (_) => Container(
                  child: Center(
                    child: Text("Halaman tidak ditemukan"),
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
