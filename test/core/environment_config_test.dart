import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_movie_app/core/environment_config.dart';

import 'data_provider.dart';

void main() {
  group("ENVIRONMENT_CONFIG_TEST", () {
    test("development environment success", () {
      // arrange
      setEnvironment(Environment.development);

      // act
      final devAPIBaseURL = DataProvider.devAPIBaseURL;
      final devBearerToken = DataProvider.devBearerToken;

      // assert
      expect(apiBaseURL, devAPIBaseURL);
      expect(apiBearerToken, devBearerToken);
    });

    test("staging environment success", () {
      // arrange
      setEnvironment(Environment.staging);

      // act
      final stagingAPIBaseURL = DataProvider.stagingAPIBaseURL;
      final stagingBearerToken = DataProvider.stagingBearerToken;

      // assert
      expect(apiBaseURL, stagingAPIBaseURL);
      expect(apiBearerToken, stagingBearerToken);
    });

    test("production environment success", () {
      // arrange
      setEnvironment(Environment.production);

      // act
      final productionAPIBaseURL = DataProvider.productionAPIBaseURL;
      final productionBearerToken = DataProvider.productionBearerToken;

      // assert
      expect(apiBaseURL, productionAPIBaseURL);
      expect(apiBearerToken, productionBearerToken);
    });
  });
}
