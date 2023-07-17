import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/data/failure.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final MovieUseCase movieUseCase;

  TopRatedCubit(this.movieUseCase) : super(TopRatedInitial());

  static final refreshController = RefreshController();

  List<GenreEntity> _genresTmp = [];

  _getGenres() async {
    final response = await movieUseCase.getGenres();

    response.fold(
      (l) {},
      (r) {
        log("getGenres() => RESPONSE $r");

        _genresTmp = r;
      },
    );
  }

  getTopRatedMovies() async {
    _getGenres();

    final response = await movieUseCase.getTopRatedMovies(1);

    response.fold(
      (l) {
        emit(TopRatedFailed(l));
        refreshController.refreshCompleted();
      },
      (r) {
        List<String> uiGenres = [];
        for (var movie in r) {
          for (int i = 0; i < movie.genreIds.length; i++) {
            int genreId = movie.genreIds[i];
            uiGenres = _genresTmp
                .where((element) => element.id == genreId)
                .map((e) => e.name)
                .toList();
          }
        }

        emit(TopRatedSuccess(uiGenres, r));
        refreshController.refreshCompleted();
      },
    );
  }

  getNextTopRatedMovies() async {
    final currentState = state as TopRatedSuccess;
    final nextPage = currentState.page + 1;

    log("getNextTopRatedMovies() => PAGE $nextPage");

    final response = await movieUseCase.getTopRatedMovies(nextPage);

    response.fold(
      (l) {
        emit(TopRatedFailed(l));
        refreshController.loadComplete();
      },
      (r) {
        List<String> uiGenres = [];
        for (var movie in r) {
          for (int i = 0; i < movie.genreIds.length; i++) {
            int genreId = movie.genreIds[i];
            uiGenres = _genresTmp
                .where((element) => element.id == genreId)
                .map((e) => e.name)
                .toList();
          }
        }

        List<MovieEntity> currentData = currentState.data;
        List<MovieEntity> result = [...currentData, ...r];
        emit(TopRatedSuccess(uiGenres, result, page: nextPage));
        refreshController.loadComplete();
      },
    );
  }
}
