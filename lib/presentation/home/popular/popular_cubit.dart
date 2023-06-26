import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'popular_state.dart';

class PopularMovieCubit extends Cubit<PopularState> {
  final MovieUseCase movieUseCase;

  PopularMovieCubit(this.movieUseCase) : super(PopularInitial());

  static final refreshController = RefreshController();

  List<GenreEntity> _genresTmp = [];

  _getGenres() async {
    final response = await movieUseCase.getGenres();

    response.fold(
      (l) {
        log("getGenres() => ERROR $l");
      },
      (r) {
        log("getGenres() => RESPONSE $r");

        _genresTmp = r;
      },
    );
  }

  getPopularMovies() async {
    _getGenres();

    final response = await movieUseCase.getPopularMovies(1);

    response.fold(
      (l) {
        emit(PopularFailed(l));
        refreshController.refreshCompleted();
      },
      (r) {
        emit(PopularSuccess(r, _genresTmp));
        refreshController.refreshCompleted();
      },
    );
  }

  getNextPopularMovies() async {
    final currentState = state as PopularSuccess;
    final nextPage = currentState.page + 1;

    log("getNextPopularMovies() => PAGE $nextPage");

    final response = await movieUseCase.getPopularMovies(nextPage);

    response.fold(
      (l) {
        emit(PopularFailed(l));
        refreshController.loadComplete();
      },
      (r) {
        List<MovieEntity> currentData = currentState.data;
        List<MovieEntity> result = [...currentData, ...r];
        emit(PopularSuccess(result, _genresTmp, page: nextPage));
        refreshController.loadComplete();
      },
    );
  }
}
