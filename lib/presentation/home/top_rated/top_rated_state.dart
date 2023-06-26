part of 'top_rated_cubit.dart';

@immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedSuccess extends TopRatedState {
  final List<MovieEntity> data;
  final List<String> genres;
  final int page;

  TopRatedSuccess(this.genres, this.data, {this.page = 1});
}

class TopRatedFailed extends TopRatedState {
  final ErrorEntity error;

  TopRatedFailed(this.error);
}
