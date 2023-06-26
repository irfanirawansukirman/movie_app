import 'dart:core';

import 'package:mvvm_movie_app/data/model/genre/genre_model.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';

class DataProvider {
  // genre scope
   List<GenreItemModel> _getGenresResponse() {
    final GenreItemModel genreItemModel =
        GenreItemModel(id: 1, name: "religion");

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
    return {"id": 0, "name": "religion"};
  }
  // genre scope
}
