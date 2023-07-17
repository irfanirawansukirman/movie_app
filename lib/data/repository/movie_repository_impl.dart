import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:mvvm_movie_app/core/remote_exception.dart';
import 'package:mvvm_movie_app/data/failure.dart';
import 'package:mvvm_movie_app/data/source/remote/movie_remote_source.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_detail_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';
import 'package:mvvm_movie_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteSource movieRemoteSource;

  MovieRepositoryImpl(this.movieRemoteSource);

  @override
  Future<Either<Failure, List<GenreEntity>>> getGenres() async {
    try {
      final response = await movieRemoteSource.getGenres();
      final data = response.genres.map((genre) => genre.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.errors?[0] ?? errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(ServerFailure("Please check your internet connection!"));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getNowPlayingMovies(
    int page,
  ) async {
    try {
      final response = await movieRemoteSource.getNowPlayingMovies(page);
      final data = response.results.map((movie) => movie.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.errors?[0] ?? errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(ServerFailure("Please check your internet connection!"));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getPopularMovies(
    int page,
  ) async {
    try {
      final response = await movieRemoteSource.getPopularMovies(page);
      final data = response.results.map((movie) => movie.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.errors?[0] ?? errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(ServerFailure("Please check your internet connection!"));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getTopRatedMovies(
    int page,
  ) async {
    try {
      final response = await movieRemoteSource.getTopRatedMovies(page);
      final data = response.results.map((movie) => movie.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.errors?[0] ?? errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(ServerFailure("Please check your internet connection!"));
    }
  }

  @override
  Future<Either<Failure, List<MovieEntity>>> getUpComingMovies(
    int page,
  ) async {
    try {
      final response = await movieRemoteSource.getUpComingMovies(page);
      final data = response.results.map((movie) => movie.toEntity()).toList();

      return Right(data);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.errors?[0] ?? errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(ServerFailure("Please check your internet connection!"));
    }
  }

  @override
  Future<Either<Failure, MovieDetailEntity>> getMovieDetail(int id) async {
    try {
      final response = await movieRemoteSource.getMovieDetail(id);
      final data = response.toEntity();

      return Right(data);
    } on RemoteException catch (e) {
      final errorModel = e.errorModel;
      final message = errorModel.statusMessage;
      return Left(ServerFailure(message));
    } on SocketException {
      return const Left(ServerFailure("Please check your internet connection!"));
    }
  }
}
