import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_detail_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/now_playing_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/popular_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/top_rated_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/up_coming_entity.dart';

abstract class MovieRepository {
  Future<Either<ErrorEntity, List<NowPlayingEntity>>> getNowPlayingMovies(
    int page,
  );

  Future<Either<ErrorEntity, List<PopularEntity>>> getPopularMovies(
    int page,
  );

  Future<Either<ErrorEntity, List<TopRatedEntity>>> getTopRatedMovies(
    int page,
  );

  Future<Either<ErrorEntity, List<UpComingEntity>>> getUpComingMovies(
    int page,
  );

  Future<Either<ErrorEntity, MovieDetailEntity>> getMovieDetail(
    int id,
  );
}
