part of 'up_coming_cubit.dart';

@immutable
abstract class UpComingState {}

class UpComingInitial extends UpComingState {}

class UpComingSuccess extends UpComingState {
  final List<MovieEntity> data;
  final List<String> genres;
  final int page;

  UpComingSuccess(this.genres, this.data, {this.page = 1});
}

class UpComingFailed extends UpComingState {
  final ErrorEntity error;

  UpComingFailed(this.error);
}
