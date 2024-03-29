import 'package:mvvm_movie_app/data/model/now_playing_model.dart';
import 'package:mvvm_movie_app/data/model/popular_movie_model.dart';
import 'package:mvvm_movie_app/data/model/top_rated_model.dart';
import 'package:mvvm_movie_app/data/model/up_coming_model.dart';

abstract class MovieRemoteSource {
  Future<NowPlayingModel> getNowPlayingMovies(int page);

  Future<PopularModel> getPopularMovies(int page);

  Future<TopRatedModel> getTopRatedMovies(int page);

  Future<UpComingModel> getUpComingMovies(int page);
}
