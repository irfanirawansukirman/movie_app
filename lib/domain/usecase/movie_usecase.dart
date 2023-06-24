import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_detail_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/now_playing_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/popular_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/top_rated_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/up_coming_entity.dart';
import 'package:mvvm_movie_app/domain/repository/movie_repository.dart';

class MovieUseCase {
  final MovieRepository movieRepository;

  MovieUseCase(this.movieRepository);

  Future<Either<ErrorEntity, List<NowPlayingEntity>>> getNowPlayingMovies(
    int page,
  ) {
    return movieRepository.getNowPlayingMovies(page);
  }

  Future<Either<ErrorEntity, List<PopularEntity>>> getPopularMovies(
    int page,
  ) {
    return movieRepository.getPopularMovies(page);
  }

  Future<Either<ErrorEntity, List<TopRatedEntity>>> getTopRatedMovies(
    int page,
  ) {
    return movieRepository.getTopRatedMovies(page);
  }

  Future<Either<ErrorEntity, List<UpComingEntity>>> getUpComingMovies(
    int page,
  ) {
    return movieRepository.getUpComingMovies(page);
  }

  Future<Either<ErrorEntity, MovieDetailEntity>> getMovieDetail(
    int id,
  ) {
    return movieRepository.getMovieDetail(id);
  }
}
