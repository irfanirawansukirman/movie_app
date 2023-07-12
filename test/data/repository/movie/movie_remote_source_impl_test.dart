import "dart:convert";

import "package:flutter_test/flutter_test.dart";
import "package:http/http.dart" as http;
import "package:mockito/mockito.dart";
import "package:mvvm_movie_app/core/environment_config.dart";
import "package:mvvm_movie_app/core/remote_exception.dart";
import "package:mvvm_movie_app/data/model/movie/now_playing_model.dart";
import "package:mvvm_movie_app/data/repository/movie/movie_remote_source_impl.dart";

import "../../../utils/json_reader.dart";
import "../../../utils/mock/mock_helper.mocks.dart";

void main() {
  late MockHttpClient mockHttpClient;
  late MovieRemoteSourceImpl movieRemoteSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    movieRemoteSourceImpl = MovieRemoteSourceImpl(mockHttpClient);
  });

  group(
    "GET_MOVIE_TEST",
    () {
      final nowPlayingMovie = NowPlayingModel.fromJson(
        json.decode(
          readJson(
            "utils/response/now_playing_response_200.json",
          ),
        ),
      );

      final nowPlayingMovieEmpty = NowPlayingModel.fromJson(
        json.decode(
          readJson(
            "utils/response/now_playing_response_200_empty.json",
          ),
        ),
      );

      test(
        "get now playing movie is success with status code 200 and data is not empty",
        () async {
          // arrange
          when(
            mockHttpClient.get(
              Uri.parse("${apiBaseURL}movie/now_playing?language=en-US&page=1"),
              headers: {"Authorization": apiBearerToken.toString()},
            ),
          ).thenAnswer(
            (_) async => http.Response(
              readJson(
                "utils/response/now_playing_response_200.json",
              ),
              200,
            ),
          );

          // act
          final result = await movieRemoteSourceImpl.getNowPlayingMovies(1);

          // assert
          expect(result, isA<NowPlayingModel>());
          expect(result.totalResults, equals(nowPlayingMovie.totalResults));
          expect(result.totalPages, equals(nowPlayingMovie.totalPages));
          expect(result.results, equals(nowPlayingMovie.results));
          expect(result.page, equals(nowPlayingMovie.page));
          expect(result.dates, equals(nowPlayingMovie.dates));
        },
      );

      test(
        "get now playing movie is success with status code 200 but data is empty",
        () async {
          // arrange
          when(
            mockHttpClient.get(
              Uri.parse("${apiBaseURL}movie/now_playing?language=en-US&page=1"),
              headers: {"Authorization": apiBearerToken.toString()},
            ),
          ).thenAnswer(
            (_) async => http.Response(
              readJson(
                "utils/response/now_playing_response_200_empty.json",
              ),
              200,
            ),
          );

          // act
          final result = await movieRemoteSourceImpl.getNowPlayingMovies(1);

          // assert
          expect(result, isA<NowPlayingModel>());
          expect(result.totalResults, equals(nowPlayingMovieEmpty.totalResults));
          expect(result.totalPages, equals(nowPlayingMovieEmpty.totalPages));
          expect(result.results, equals(nowPlayingMovieEmpty.results));
          expect(result.page, equals(nowPlayingMovieEmpty.page));
          expect(result.dates, equals(nowPlayingMovieEmpty.dates));
        },
      );

      test(
        "get now playing movie is failed with status code 422 and throw RemoteException",
        () async {
          // arrange
          when(
            mockHttpClient.get(
              Uri.parse("${apiBaseURL}movie/now_playing?language=en-US&page=1"),
              headers: {"Authorization": apiBearerToken.toString()},
            ),
          ).thenAnswer(
            (_) async => http.Response(
              readJson(
                "utils/response/error_data_not_found_422.json",
              ),
              422,
            ),
          );

          // act
          final call = movieRemoteSourceImpl.getNowPlayingMovies(1);

          // assert
          expect(() => call, throwsA(isA<RemoteException>()));
        },
      );
    },
  );
}
