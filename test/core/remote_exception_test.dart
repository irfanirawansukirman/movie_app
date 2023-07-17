import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_movie_app/core/remote_exception.dart';
import 'package:mvvm_movie_app/data/model/error_model.dart';

void main() {
  test(
    "remote exception test success",
    () {
      // arrange

      // act
      final errorModel = ErrorModel(
        errors: const [],
        success: true,
        statusCode: 200,
        statusMessage: "success",
      );

      // assert
      expect(
        RemoteException(errorModel),
        allOf(
          isA<RemoteException>(),
          predicate<RemoteException>(
            (remoteException) {
              return remoteException.errorModel.statusCode == 200;
            },
          ),
        ),
      );
    },
  );

  test(
    "remote exception test failed",
    () {
      // arrange

      // act
      final errorModel = ErrorModel(
        errors: const [],
        success: false,
        statusCode: 404,
        statusMessage: "failed",
      );

      // assert
      expect(
        RemoteException(errorModel),
        allOf(
          isA<RemoteException>(),
          predicate<RemoteException>(
            (remoteException) {
              return remoteException.errorModel.statusCode == 404;
            },
          ),
        ),
      );
    },
  );
}
