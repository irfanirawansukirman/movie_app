import 'package:equatable/equatable.dart';

class TopRatedEntity extends Equatable {
  TopRatedEntity({
    required this.id,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  late final int id;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final double voteAverage;
  late final int voteCount;

  @override
  List<Object?> get props => [
        id,
        popularity,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
      ];
}
