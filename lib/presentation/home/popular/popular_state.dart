part of 'popular_cubit.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularSuccess extends PopularState {
  final List<PopularEntity> data;
  final int page;

  PopularSuccess(this.data, {this.page = 1});
}

class PopularFailed extends PopularState {
  final ErrorEntity? errorEntity;

  PopularFailed(this.errorEntity);
}
