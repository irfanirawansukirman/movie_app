import 'package:flutter_test/flutter_test.dart';

import '../../../core/data_provider.dart';

void main() {
  late DataProvider dataProvider;

  setUp(() {
    dataProvider = DataProvider();
  });

  group(
    "GET_GENRES_IS_SUCCESS_200",
    () {
      test(
        "the data should be as expected",
        () async {
          // arrange

          // act
          final actual = dataProvider.processGenresToEntity();
          final expected = dataProvider.getGenresEntity();

          // assert
          expect(actual, expected);
        },
      );

      test(
        "the genre value should be as expected json",
        () async {
          // arrange

          // act
          final actual = dataProvider.getGenreItemModel().toJson();
          final expected = dataProvider.getGenreItemModelAsMap();

          // assert
          expect(actual, expected);
        },
      );
    },
  );
}
