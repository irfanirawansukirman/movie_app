part of 'top_rated_cubit.dart';

@immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedSuccess extends TopRatedState {
  final List<TopRatedEntity> data;
  final int page;

  TopRatedSuccess(this.data, {this.page = 1});
}

class TopRatedFailed extends TopRatedState {
  final ErrorEntity error;

  TopRatedFailed(this.error);
}
