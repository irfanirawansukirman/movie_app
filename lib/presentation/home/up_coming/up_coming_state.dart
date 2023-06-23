part of 'up_coming_cubit.dart';

@immutable
abstract class UpComingState {}

class UpComingInitial extends UpComingState {}

class UpComingSuccess extends UpComingState {
  final List<UpComingEntity> data;
  final int page;

  UpComingSuccess(this.data, {this.page = 1});
}

class UpComingFailed extends UpComingState {
  final ErrorEntity errorEntity;

  UpComingFailed(this.errorEntity);
}
