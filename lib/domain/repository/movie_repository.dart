import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_detail_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<ErrorEntity, List<GenreEntity>>> getGenres();

  Future<Either<ErrorEntity, List<MovieEntity>>> getNowPlayingMovies(
    int page,
  );

  Future<Either<ErrorEntity, List<MovieEntity>>> getPopularMovies(
    int page,
  );

  Future<Either<ErrorEntity, List<MovieEntity>>> getTopRatedMovies(
    int page,
  );

  Future<Either<ErrorEntity, List<MovieEntity>>> getUpComingMovies(
    int page,
  );

  Future<Either<ErrorEntity, MovieDetailEntity>> getMovieDetail(
    int id,
  );
}
