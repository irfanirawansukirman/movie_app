import 'dart:core';

import 'package:mvvm_movie_app/data/model/genre/genre_model.dart';
import 'package:mvvm_movie_app/data/model/movie/now_playing_model.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';

class DataProvider {
  List<dynamic> getEmptyListResponse() {
    return [];
  }

  List<dynamic>? getFailedResponse() {
    return null;
  }

  // genre scope
  List<GenreItemModel> _getGenresResponse() {
    final genreItemModel = GenreItemModel(id: 1, name: "religion");

    return [genreItemModel];
  }

  List<GenreEntity> processGenresToEntity() {
    return _getGenresResponse().map((e) => e.toEntity()).toList();
  }

  List<GenreEntity> getGenresEntity() {
    return _getGenresResponse().map((e) => e.toEntity()).toList();
  }

  GenreItemModel getGenreItemModel() {
    return GenreItemModel(id: 0, name: "religion");
  }

  Map<String, dynamic> getGenreItemModelAsMap() {
    return {
      "id": 0,
      "name": "religion",
    };
  }

  // genre scope

  // movie list scope
  List<NowPlayingItemModel> _getNowPlayingMoviesResponse() {
    final nowPlayingItemModel = getNowPlayingItemModel();

    return [nowPlayingItemModel];
  }

  List<MovieEntity> processNowPlayingMoviesToEntity() {
    return _getNowPlayingMoviesResponse().map((e) => e.toEntity()).toList();
  }

  List<MovieEntity> getNowPlayingMoviesEntity() {
    return _getNowPlayingMoviesResponse().map((e) => e.toEntity()).toList();
  }

  NowPlayingItemModel getNowPlayingItemModel() {
    return NowPlayingItemModel(
      adult: false,
      backdropPath: "/test",
      genreIds: [],
      id: 0,
      originalLanguage: "test",
      originalTitle: "test",
      overview: "test",
      popularity: 0.0,
      posterPath: "/test",
      releaseDate: "12-06-2023",
      title: "test",
      video: false,
      voteAverage: 0.0,
      voteCount: 0,
    );
  }

  Map<String, dynamic> getNowPlayingItemModelAsMap() {
    return {
      'adult': false,
      'backdrop_path': '/test',
      'genre_ids': [],
      'id': 0,
      'original_language': 'test',
      'original_title': 'test',
      'overview': 'test',
      'popularity': 0.0,
      'poster_path': '/test',
      'release_date': '12-06-2023',
      'title': 'test',
      'video': false,
      'vote_average': 0.0,
      'vote_count': 0
    };
  }
// movie list scope
}
