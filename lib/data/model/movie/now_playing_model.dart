import 'package:equatable/equatable.dart';
import 'package:mvvm_movie_app/core/common.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';

class NowPlayingModel extends Equatable {
  NowPlayingModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  late final NowPlayingDatesModel dates;
  late final int page;
  late final List<NowPlayingItemModel> results;
  late final int totalPages;
  late final int totalResults;

  NowPlayingModel.fromJson(Map<String, dynamic> json) {
    dates = NowPlayingDatesModel.fromJson(json['dates']);
    page = json['page'];
    results = List.from(json['results'])
        .map((e) => NowPlayingItemModel.fromJson(e))
        .toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dates'] = dates.toJson();
    _data['page'] = page;
    _data['results'] = results.map((e) => e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }

  @override
  List<Object?> get props => [
        dates,
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class NowPlayingDatesModel extends Equatable {
  NowPlayingDatesModel({
    required this.maximum,
    required this.minimum,
  });

  late final String maximum;
  late final String minimum;

  NowPlayingDatesModel.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['maximum'] = maximum;
    _data['minimum'] = minimum;
    return _data;
  }

  @override
  List<Object?> get props => [
        maximum,
        minimum,
      ];
}

class NowPlayingItemModel extends Equatable {
  NowPlayingItemModel({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  late final bool adult;
  late final String backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final dynamic voteAverage;
  late final int voteCount;

  NowPlayingItemModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = tryCast<String, String>(json['backdrop_path'], "");
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = tryCast<String, String>(json['poster_path'], "");
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  MovieEntity toEntity() => MovieEntity(
        id: id,
        popularity: popularity,
        posterPath: posterPath,
        title: title,
        genreIds: genreIds,
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
