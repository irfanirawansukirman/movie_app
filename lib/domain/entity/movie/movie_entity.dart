import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  MovieEntity(
      {required this.id,
      required this.popularity,
      required this.posterPath,
      required this.title,
      required this.genreIds});

  late final int id;
  late final double popularity;
  late final String posterPath;
  late final String title;
  late final List<int> genreIds;

  @override
  List<Object?> get props => [
        id,
        popularity,
        posterPath,
        title,
        genreIds,
      ];
}
