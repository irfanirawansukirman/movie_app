import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_movie_app/core/remote_exception.dart';
import 'package:mvvm_movie_app/data/model/error_model.dart';
import 'package:mvvm_movie_app/data/model/movie/now_playing_model.dart';
import 'package:mvvm_movie_app/data/repository/movie_repository_impl.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';

import '../../utils/json_reader.dart';
import '../../utils/mock/mock_helper.mocks.dart';

void main() {
  late MockMovieRemoteSource mockMovieRemoteSource;
  late MovieRepositoryImpl movieRepositoryImpl;

  final nowPlayingMovieModel = NowPlayingModel.fromJson(
    json.decode(
      readJson(
        "utils/response/now_playing_response_200.json",
      ),
    ),
  );

  setUp(() {
    mockMovieRemoteSource = MockMovieRemoteSource();
    movieRepositoryImpl = MovieRepositoryImpl(mockMovieRemoteSource);
  });

  group("GET_NOW_PLAYING_MOVIES", () {
    test(
        'getNowPlayingMovies returns Right with MovieEntity list on successful response',
        () async {
      // arrange
      when(mockMovieRemoteSource.getNowPlayingMovies(1))
          .thenAnswer((_) async => nowPlayingMovieModel);

      // act
      final result = await movieRepositoryImpl.getNowPlayingMovies(1);

      // assert
      verify(mockMovieRemoteSource.getNowPlayingMovies(1)).called(1);
      final expectedData = nowPlayingMovieModel.results
          .map((movie) => movie.toEntity())
          .toList();

      result.fold((exception) {}, (actualData) {
        expect(result.isRight(), true);
        expect(actualData, equals(expectedData));
        expect(actualData[0], isA<MovieEntity>());
      });
    });
  });

  test('getNowPlayingMovies returns Left with ErrorEntity on RemoteException',
      () async {
    final errorModel = ErrorModel.fromJson(
      json.decode(
        readJson(
          "utils/response/error_page_exceed_500.json",
        ),
      ),
    );

    // arrange
    when(mockMovieRemoteSource.getNowPlayingMovies(1)).thenThrow(
      RemoteException(
        errorModel,
      ),
    );

    // act
    final call = movieRepositoryImpl.getNowPlayingMovies(1);

    // assert
    verify(mockMovieRemoteSource.getNowPlayingMovies(1)).called(1);

    final result = await call;
    result.fold((exception) {
      expect(result.isLeft(), true);
      expect(exception.message, errorModel.errors?[0] ?? '');
    }, (_) {});
  });
}
