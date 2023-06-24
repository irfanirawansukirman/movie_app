import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/domain/entity/movie/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/movie/top_rated_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final MovieUseCase movieUseCase;

  TopRatedCubit(this.movieUseCase) : super(TopRatedInitial());

  static final refreshController = RefreshController();

  getTopRatedMovies() async {
    final response = await movieUseCase.getTopRatedMovies(1);

    response.fold(
          (l) {
        emit(TopRatedFailed(l));
        refreshController.refreshCompleted();
      },
          (r) {
        emit(TopRatedSuccess(r));
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
        List<TopRatedEntity> currentData = currentState.data;
        List<TopRatedEntity> result = [...currentData, ...r];
        emit(TopRatedSuccess(result, page: nextPage));
        refreshController.loadComplete();
      },
    );
  }
}
