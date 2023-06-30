import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_movie_app/core/common.dart';

import 'data_provider.dart';

void main() {
  test("tryCast function success", () {
    // arrange

    // act
    final actual = tryCast<double, double>(DataProvider.valueDoubleTmp, 0.0);
    final result = tryCast<double, double>(DataProvider.valueDoubleTmp, 0.0);

    // assert
    expect(result, actual);
  });
}