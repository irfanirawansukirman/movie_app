import 'package:mvvm_movie_app/data/model/movie/movie_detail_model.dart';
import 'package:mvvm_movie_app/data/model/movie/now_playing_model.dart';
import 'package:mvvm_movie_app/data/model/movie/popular_movie_model.dart';
import 'package:mvvm_movie_app/data/model/movie/top_rated_model.dart';
import 'package:mvvm_movie_app/data/model/movie/up_coming_model.dart';

abstract class MovieRemoteSource {
  Future<NowPlayingModel> getNowPlayingMovies(int page);

  Future<PopularModel> getPopularMovies(int page);

  Future<TopRatedModel> getTopRatedMovies(int page);

  Future<UpComingModel> getUpComingMovies(int page);

  Future<MovieDetailModel> getMovieDetail(int id);
}
