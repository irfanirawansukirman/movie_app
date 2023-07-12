import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:mvvm_movie_app/core/environment_config.dart';
import 'package:mvvm_movie_app/core/remote_exception.dart';
import 'package:mvvm_movie_app/data/model/error_model.dart';
import 'package:mvvm_movie_app/data/model/genre/genre_model.dart';
import 'package:mvvm_movie_app/data/model/movie/movie_detail_model.dart';
import 'package:mvvm_movie_app/data/model/movie/now_playing_model.dart';
import 'package:mvvm_movie_app/data/model/movie/popular_movie_model.dart';
import 'package:mvvm_movie_app/data/model/movie/top_rated_model.dart';
import 'package:mvvm_movie_app/data/model/movie/up_coming_model.dart';
import 'package:mvvm_movie_app/data/source/remote/movie_remote_source.dart';
import 'package:http/http.dart' as http;

class MovieRemoteSourceImpl implements MovieRemoteSource {
  final http.Client client;

  MovieRemoteSourceImpl(this.client);

  @override
  Future<GenreModel> getGenres() async {
    final response = await client.get(
      Uri.parse("${apiBaseURL}genre/movie/list?language=en"),
      headers: {"Authorization": apiBearerToken},
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log("getGenres() => RESPONSE $body");

      return GenreModel.fromJson(body);
    } else {
      throw RemoteException(ErrorModel.fromJson(body));
    }
  }

  @override
  Future<NowPlayingModel> getNowPlayingMovies(int page) async {
    final response = await client.get(
      Uri.parse("${apiBaseURL}movie/now_playing?language=en-US&page=$page"),
      headers: {"Authorization": apiBearerToken.toString()},
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log("getNowPlayingMovies() => RESPONSE $body");

      return NowPlayingModel.fromJson(body);
    } else {
      throw RemoteException(ErrorModel.fromJson(body));
    }
  }

  @override
  Future<PopularModel> getPopularMovies(int page) async {
    final response = await client.get(
      Uri.parse("${apiBaseURL}movie/popular?language=en-US&page=$page"),
      headers: {"Authorization": apiBearerToken},
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log("getPopularMovies() => RESPONSE $body");

      return PopularModel.fromJson(body);
    } else {
      throw RemoteException(ErrorModel.fromJson(body));
    }
  }

  @override
  Future<TopRatedModel> getTopRatedMovies(int page) async {
    final response = await client.get(
      Uri.parse("${apiBaseURL}movie/top_rated?language=en-US&page=$page"),
      headers: {"Authorization": apiBearerToken},
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log("getTopRatedMovies() => RESPONSE $body");

      return TopRatedModel.fromJson(body);
    } else {
      throw RemoteException(ErrorModel.fromJson(body));
    }
  }

  @override
  Future<UpComingModel> getUpComingMovies(int page) async {
    final response = await client.get(
      Uri.parse("${apiBaseURL}movie/upcoming?language=en-US&page=$page"),
      headers: {"Authorization": apiBearerToken},
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log("getUpComingMovies() => RESPONSE $body");

      return UpComingModel.fromJson(body);
    } else {
      throw RemoteException(ErrorModel.fromJson(body));
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await client.get(
      Uri.parse("${apiBaseURL}movie/$id?language=en-US"),
      headers: {"Authorization": apiBearerToken},
    );

    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(body);
    } else {
      throw RemoteException(ErrorModel.fromJson(body));
    }
  }
}
