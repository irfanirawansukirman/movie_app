import 'package:equatable/equatable.dart';
import 'package:mvvm_movie_app/core/common.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';

class ErrorModel extends Equatable {
  ErrorModel({
    required this.errors,
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  // movie list model
  late final List<String> errors;
  late final bool success;

  // movie detail model
  late final int statusCode;
  late final String statusMessage;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    errors = List.castFrom<dynamic, String>(json['errors']);
    success = json['success'];
    statusCode = tryCast(json['status_code'], 400);
    statusMessage = tryCast(json['status_message'],
        "The resource you requested could not be found.");
  }

  ErrorEntity toEntity() => ErrorEntity(
        code: 404,
        message: tryCast(errors[0], statusMessage),
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['errors'] = errors;
    _data['success'] = success;
    _data['status_code'] = statusCode;
    _data['status_message'] = statusMessage;
    return _data;
  }

  @override
  List<Object?> get props => [
        errors,
        success,
        statusCode,
        statusMessage,
      ];
}
