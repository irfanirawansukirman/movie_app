import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/movie_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final MovieUseCase movieUseCase;

  NowPlayingCubit(this.movieUseCase) : super(NowPlayingInitial());

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

  getNowPlayingMovies() async {
    _getGenres();

    final response = await movieUseCase.getNowPlayingMovies(1);

    response.fold(
      (l) {
        emit(NowPlayingFailed(l));
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

        emit(NowPlayingSuccess(uiGenres, r));
        refreshController.refreshCompleted();
      },
    );
  }

  getNextNowPlayingMovies() async {
    final currentState = state as NowPlayingSuccess;
    final nextPage = currentState.page + 1;

    log("getNextNowPlayingMovies() => PAGE $nextPage");

    final response = await movieUseCase.getNowPlayingMovies(nextPage);

    response.fold(
      (l) {
        emit(NowPlayingFailed(l));
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
        emit(NowPlayingSuccess(uiGenres, result, page: nextPage));
        refreshController.loadComplete();
      },
    );
  }
}
