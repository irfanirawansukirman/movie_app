class MovieDetailEntity {
  MovieDetailEntity({
    required this.id,
    required this.overview,
    required this.popularity,
    required this.backdropPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  late final int id;
  late final String overview;
  late final double popularity;
  late final String backdropPath;
  late final String releaseDate;
  late final String title;
  late final double voteAverage;
  late final int voteCount;

  MovieDetailEntity.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    overview = json['overview'];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['backdrop_path'] = backdropPath;
    _data['id'] = id;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}
