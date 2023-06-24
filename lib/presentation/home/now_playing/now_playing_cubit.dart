import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/now_playing_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final MovieUseCase movieUseCase;

  NowPlayingCubit(this.movieUseCase) : super(NowPlayingInitial());

  static final refreshController = RefreshController();

  getNowPlayingMovies() async {
    final response = await movieUseCase.getNowPlayingMovies(1);

    response.fold(
      (l) {
        emit(NowPlayingFailed(l));
        refreshController.refreshCompleted();
      },
      (r) {
        emit(NowPlayingSuccess(r));
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
        List<NowPlayingEntity> currentData = currentState.data;
        List<NowPlayingEntity> result = [...currentData, ...r];
        emit(NowPlayingSuccess(result, page: nextPage));
        refreshController.loadComplete();
      },
    );
  }
}
