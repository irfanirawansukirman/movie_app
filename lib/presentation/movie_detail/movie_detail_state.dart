part of 'movie_detail_cubit.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  final MovieDetailEntity data;
  
  MovieDetailSuccess(this.data);
}

class MovieDetailFailed extends MovieDetailState {
  final Failure error;
  
  MovieDetailFailed(this.error);
}
