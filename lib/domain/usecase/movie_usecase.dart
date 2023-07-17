import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/data/failure.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_detail_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';
import 'package:mvvm_movie_app/domain/repository/movie_repository.dart';

class MovieUseCase {
  final MovieRepository movieRepository;

  MovieUseCase(this.movieRepository);

  Future<Either<Failure, List<GenreEntity>>> getGenres() {
    return movieRepository.getGenres();
  }

  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(
    int page,
  ) {
    return movieRepository.getNowPlayingMovies(page);
  }

  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(
    int page,
  ) {
    return movieRepository.getPopularMovies(page);
  }

  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(
    int page,
  ) {
    return movieRepository.getTopRatedMovies(page);
  }

  Future<Either<Failure, List<MovieEntity>>> getUpComingMovies(
    int page,
  ) {
    return movieRepository.getUpComingMovies(page);
  }

  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(
    int id,
  ) {
    return movieRepository.getMovieDetail(id);
  }
}
