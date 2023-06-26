import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/core/remote_exception.dart';
import 'package:mvvm_movie_app/data/model/genre/genre_model.dart';
import 'package:mvvm_movie_app/data/repository/movie/movie_remote_source_impl.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_detail_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';
import 'package:mvvm_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryDomainImpl implements MovieRepository {
  final MovieRemoteSourceImpl movieRemoteSourceImpl;

  MovieRepositoryDomainImpl(this.movieRemoteSourceImpl);

  @override
  Future<Either<ErrorEntity, List<GenreEntity>>> getGenres() async {
    try {
      final response = await movieRemoteSourceImpl.getGenres();
      final data = response.genres.map((genre) => genre.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      return Left(e.errorModel.toEntity());
    }
  }

  @override
  Future<Either<ErrorEntity, List<MovieEntity>>> getNowPlayingMovies(
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
  Future<Either<ErrorEntity, List<MovieEntity>>> getPopularMovies(
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
  Future<Either<ErrorEntity, List<MovieEntity>>> getTopRatedMovies(
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
  Future<Either<ErrorEntity, List<MovieEntity>>> getUpComingMovies(
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

  @override
  Future<Either<ErrorEntity, MovieDetailEntity>> getMovieDetail(int id) async {
    try {
      final response = await movieRemoteSourceImpl.getMovieDetail(id);
      final data = response.toEntity();

      return Right(data);
    } on RemoteException catch (e) {
      return Left(e.errorModel.toEntity());
    }
  }
}
