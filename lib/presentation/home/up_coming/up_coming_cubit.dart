import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  final MovieUseCase movieUseCase;

  UpComingCubit(this.movieUseCase) : super(UpComingInitial());

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

  getUpComingMovies() async {
    _getGenres();

    final response = await movieUseCase.getUpComingMovies(1);

    response.fold(
      (l) {
        emit(UpComingFailed(l));
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

        emit(UpComingSuccess(uiGenres, r));
        refreshController.refreshCompleted();
      },
    );
  }

  getNextUpComingMovies() async {
    final currentState = state as UpComingSuccess;
    final nextPage = currentState.page + 1;

    log("getNextUpComingMovies() => PAGE $nextPage");

    final response = await movieUseCase.getUpComingMovies(nextPage);

    response.fold(
      (l) {
        emit(UpComingFailed(l));
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
        emit(UpComingSuccess(uiGenres, result, page: nextPage));
        refreshController.loadComplete();
      },
    );
  }
}
