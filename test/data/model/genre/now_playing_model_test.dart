import 'package:flutter_test/flutter_test.dart';

import '../../../core/data_provider.dart';

void main() {
  late DataProvider dataProvider;

  setUp(
    () {
      dataProvider = DataProvider();
    },
  );

  group(
    "GET_NOW_PLAYING_MOVIES_IS_SUCCESS",
    () {
      test(
        "the data should be as expected",
        () {
          // arrange

          // act
          final actual = dataProvider.processNowPlayingMoviesToEntity();
          final expected = dataProvider.getNowPlayingMoviesEntity();

          // assert
          expect(actual, expected);
        },
      );

      test(
        "the now playing movie value should be as expected json",
        () async {
          // arrange

          // act
          final actual = dataProvider.getNowPlayingItemModel().toJson();
          final expected = dataProvider.getNowPlayingItemModelAsMap();

          // assert
          expect(actual, expected);
        },
      );

      test(
        "the data is empty",
            () {
          // arrange

          // act
          final actual = dataProvider.getEmptyListResponse();
          final expected = [];

          // assert
          expect(actual, expected);
        },
      );
    },
  );

  group(
    "GET_NOW_PLAYING_MOVIES_IS_FAILED",
        () {
      test(
        "the data is null",
            () {
          // arrange

          // act
          final actual = dataProvider.getFailedResponse();

          // assert
          expect(actual, null);
        },
      );
    },
  );
}
