part of 'popular_cubit.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularSuccess extends PopularState {
  final List<MovieEntity> data;
  final List<GenreEntity> genres;
  final int page;

  PopularSuccess(this.data, this.genres, {this.page = 1});
}

class PopularFailed extends PopularState {
  final Failure error;

  PopularFailed(this.error);
}
