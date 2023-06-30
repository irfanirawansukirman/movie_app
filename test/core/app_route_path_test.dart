import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_movie_app/core/app_route_path.dart';

void main() {
  group("APP_ROUTE_PATH_TEST", () {
    test("home path success", () {
      // arrange

      // act

      // assert
      expect(AppRoutePath.home, "/");
    });

    test("movie detail success", () {
      // arrange

      // act

      // assert
      expect(AppRoutePath.movieDetail, "/movieDetail");
    });

    test("about success", () {
      // arrange

      // act

      // assert
      expect(AppRoutePath.about, "/about");
    });
  });
}
