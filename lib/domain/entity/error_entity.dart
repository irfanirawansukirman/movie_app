import 'package:equatable/equatable.dart';

class ErrorEntity extends Equatable {
  ErrorEntity({
    required this.code,
    required this.message,
  });

  late final int code;
  late final String message;

  @override
  List<Object?> get props => [
        code,
        message,
      ];
}
