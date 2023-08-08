import "package:flutter_test/flutter_test.dart";
import "package:bloc_test/bloc_test.dart";
import "package:mockito/mockito.dart";
import "package:dartz/dartz.dart";
import "package:mockito/annotations.dart";
import "package:mvvm_movie_app/data/failure.dart";
import "package:mvvm_movie_app/domain/entity/movie/genre_entity.dart";
import "package:mvvm_movie_app/domain/entity/movie/movie_entity.dart";
import "package:mvvm_movie_app/domain/usecase/movie_usecase.dart";
import "package:mvvm_movie_app/presentation/home/now_playing/now_playing_cubit.dart";

import "now_playing_cubit_test.mocks.dart";

@GenerateMocks([MovieUseCase])
void main() {
  late MockMovieUseCase mockMovieUseCase;
  late NowPlayingCubit nowPlayingCubit;

  setUp(() {
    mockMovieUseCase = MockMovieUseCase();
    nowPlayingCubit = NowPlayingCubit(mockMovieUseCase);
  });

  tearDown(() => nowPlayingCubit.close());

  test("initial state is NowPlayingInitial", () {
    expect(nowPlayingCubit.state, NowPlayingInitial());
  });

  blocTest<NowPlayingCubit, NowPlayingState>(
    "emits NowPlayingSuccess when getNowPlayingMovies is called successfully",
    build: () {
      when(mockMovieUseCase.getGenres()).thenAnswer(
        (_) async => Right([GenreEntity(id: 0, name: "")]),
      );
      when(mockMovieUseCase.getNowPlayingMovies(1)).thenAnswer(
        (_) async => Right([
          MovieEntity(
            id: 0,
            popularity: 0.0,
            posterPath: "",
            title: "",
            genreIds: const [0],
          )
        ]),
      );
      return nowPlayingCubit;
    },
    act: (cubit) => cubit.getNowPlayingMovies(),
    expect: () => [
      NowPlayingSuccess(const [
        ""
      ], [
        MovieEntity(
          id: 0,
          popularity: 0.0,
          posterPath: "",
          title: "",
          genreIds: const [0],
        )
      ])
    ],
    verify: (cubit) {
      verify(mockMovieUseCase.getGenres()).called(1);
      verify(mockMovieUseCase.getNowPlayingMovies(1)).called(1);
    },
  );

  blocTest<NowPlayingCubit, NowPlayingState>(
    "emits NowPlayingFailed when getNowPlayingMovies returns an error",
    build: () {
      when(mockMovieUseCase.getGenres()).thenAnswer(
        (_) async => Right(
          [GenreEntity(id: 0, name: "")],
        ),
      );
      when(mockMovieUseCase.getNowPlayingMovies(1)).thenAnswer(
        (_) async => const Left(
          ServerFailure("error"),
        ),
      );
      return nowPlayingCubit;
    },
    act: (cubit) => cubit.getNowPlayingMovies(),
    expect: () => [
      NowPlayingFailed(
        const ServerFailure("error"),
      ),
    ],
    verify: (cubit) {
      verify(mockMovieUseCase.getGenres()).called(1);
      verify(mockMovieUseCase.getNowPlayingMovies(1)).called(1);
    },
  );
}
