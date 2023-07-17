import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/data/failure.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_detail_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final MovieUseCase movieUseCase;

  MovieDetailCubit(this.movieUseCase) : super(MovieDetailInitial());

  getMovieDetail(int id) async {
    final response = await movieUseCase.getMovieDetail(id);

    response.fold(
      (l) => emit(MovieDetailFailed(l)),
      (r) => emit(MovieDetailSuccess(r)),
    );
  }
}
