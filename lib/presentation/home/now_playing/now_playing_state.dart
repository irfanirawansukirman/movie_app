part of 'now_playing_cubit.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingSuccess extends NowPlayingState {
  final List<NowPlayingEntity> data;
  final int page;

  NowPlayingSuccess(this.data, {this.page = 1});
}

class NowPlayingFailed extends NowPlayingState {
  final ErrorEntity error;

  NowPlayingFailed(this.error);
}
