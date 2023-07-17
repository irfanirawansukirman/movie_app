import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/data/failure.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_detail_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<GenreEntity>>> getGenres();

  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(
    int page,
  );

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(
    int page,
  );

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(
    int page,
  );

  Future<Either<Failure, List<MovieEntity>>> getUpComingMovies(
    int page,
  );

  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(
    int id,
  );
}
