import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';

class GenreModel {
  GenreModel({
    required this.genres,
  });

  late final List<GenreItemModel> genres;

  GenreModel.fromJson(Map<String, dynamic> json) {
    genres = List.from(json['genres'])
        .map((e) => GenreItemModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['genres'] = genres.map((e) => e.toJson()).toList();
    return _data;
  }
}

class GenreItemModel {
  GenreItemModel({
    required this.id,
    required this.name,
  });

  late final int id;
  late final String name;

  GenreItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  GenreEntity toEntity() => GenreEntity(
        id: id,
        name: name,
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
