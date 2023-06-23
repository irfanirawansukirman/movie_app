import 'package:mvvm_movie_app/data/model/error_model.dart';

class RemoteException implements Exception {
  final ErrorModel errorModel;

  RemoteException(this.errorModel);
}
