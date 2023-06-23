import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/domain/entity/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/now_playing_entity.dart';
import 'package:mvvm_movie_app/domain/entity/popular_entity.dart';
import 'package:mvvm_movie_app/domain/entity/top_rated_entity.dart';
import 'package:mvvm_movie_app/domain/entity/up_coming_entity.dart';

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
}
