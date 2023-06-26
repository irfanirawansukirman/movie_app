import 'package:equatable/equatable.dart';

class GenreEntity extends Equatable {
  GenreEntity({
    required this.id,
    required this.name,
  });

  late final int id;
  late final String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
