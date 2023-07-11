import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_movie_app/data/model/error_model.dart';

import '../../core/data_provider.dart';

void main() {
  late DataProvider dataProvider;

  setUp(
    () {
      dataProvider = DataProvider();
    },
  );

  test(
    "get error model failed",
    () {
      // arrange

      // act
      final actual = dataProvider.getErrorModel(false);
      final expected = ErrorModel(
        errors: [],
        success: false,
        statusCode: 400,
        statusMessage: 'failed',
      );

      // assert
      expect(actual.errors, expected.errors);
      expect(actual.success, expected.success);
      expect(actual.statusCode, expected.statusCode);
      expect(actual.statusMessage, expected.statusMessage);
    },
  );
}
