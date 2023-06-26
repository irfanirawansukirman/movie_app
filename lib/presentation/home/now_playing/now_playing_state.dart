part of 'now_playing_cubit.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingSuccess extends NowPlayingState {
  final List<MovieEntity> data;
  final List<String> genres;
  final int page;

  NowPlayingSuccess(this.genres, this.data, {this.page = 1});
}

class NowPlayingFailed extends NowPlayingState {
  final ErrorEntity error;

  NowPlayingFailed(this.error);
}
