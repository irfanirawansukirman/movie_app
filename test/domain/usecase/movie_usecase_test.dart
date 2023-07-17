import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';

import '../../utils/mock/mock_helper.mocks.dart';

void main() {
  late MockMovieRepository mockMovieRepository;
  late MovieUseCase movieUseCase;

  setUp(() {
    mockMovieRepository = MockMovieRepository();
    movieUseCase = MovieUseCase(mockMovieRepository);
  });

  test("should get now playing movies from repository", () async {
    final nowPlyingMoviesList = [
      MovieEntity(
        id: 0,
        popularity: 0.0,
        posterPath: "",
        title: "",
        genreIds: const [1, 2, 3],
      )
    ];

    // arrange
    when(mockMovieRepository.getNowPlayingMovies(1))
        .thenAnswer((_) async => Right(nowPlyingMoviesList));

    // act
    final result = await movieUseCase.getNowPlayingMovies(1);

    // assert
    expect(result, equals(Right(nowPlyingMoviesList)));
  });
}
