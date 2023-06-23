import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/core/remote_exception.dart';
import 'package:mvvm_movie_app/data/repository/movie/movie_remote_source_impl.dart';
import 'package:mvvm_movie_app/domain/entity/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/now_playing_entity.dart';
import 'package:mvvm_movie_app/domain/entity/popular_entity.dart';
import 'package:mvvm_movie_app/domain/entity/top_rated_entity.dart';
import 'package:mvvm_movie_app/domain/entity/up_coming_entity.dart';
import 'package:mvvm_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryDomainImpl implements MovieRepository {
  final MovieRemoteSourceImpl movieRemoteSourceImpl;

  MovieRepositoryDomainImpl(this.movieRemoteSourceImpl);

  @override
  Future<Either<ErrorEntity, List<NowPlayingEntity>>> getNowPlayingMovies(
    int page,
  ) async {
    try {
      final response = await movieRemoteSourceImpl.getNowPlayingMovies(page);
      final data = response.results.map((movie) => movie.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      return Left(e.errorModel.toEntity());
    }
  }

  @override
  Future<Either<ErrorEntity, List<PopularEntity>>> getPopularMovies(
    int page,
  ) async {
    try {
      final response = await movieRemoteSourceImpl.getPopularMovies(page);
      final data = response.results.map((movie) => movie.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      return Left(e.errorModel.toEntity());
    }
  }

  @override
  Future<Either<ErrorEntity, List<TopRatedEntity>>> getTopRatedMovies(
    int page,
  ) async {
    try {
      final response = await movieRemoteSourceImpl.getTopRatedMovies(page);
      final data = response.results.map((movie) => movie.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      return Left(e.errorModel.toEntity());
    }
  }

  @override
  Future<Either<ErrorEntity, List<UpComingEntity>>> getUpComingMovies(
    int page,
  ) async {
    try {
      final response = await movieRemoteSourceImpl.getUpComingMovies(page);
      final data = response.results.map((movie) => movie.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      return Left(e.errorModel.toEntity());
    }
  }
}
