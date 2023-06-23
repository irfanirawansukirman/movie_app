import 'package:mvvm_movie_app/domain/entity/error_entity.dart';

class ErrorModel {
  ErrorModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  late final int statusCode;
  late final String statusMessage;
  late final bool success;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
  }

  ErrorEntity toEntity() => ErrorEntity(
        code: statusCode,
        message: statusMessage,
      );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_code'] = statusCode;
    _data['status_message'] = statusMessage;
    _data['success'] = success;
    return _data;
  }
}
