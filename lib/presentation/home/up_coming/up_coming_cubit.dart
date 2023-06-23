import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/domain/entity/error_entity.dart';
import 'package:mvvm_movie_app/domain/entity/top_rated_entity.dart';
import 'package:mvvm_movie_app/domain/entity/up_coming_entity.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'up_coming_state.dart';

class UpComingCubit extends Cubit<UpComingState> {
  final MovieUseCase movieUseCase;

  UpComingCubit(this.movieUseCase) : super(UpComingInitial());

  static final refreshController = RefreshController();

  getUpComingMovies() async {
    final response = await movieUseCase.getUpComingMovies(1);

    response.fold(
          (l) {
        emit(UpComingFailed(l));
        refreshController.refreshCompleted();
      },
          (r) {
        emit(UpComingSuccess(r));
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
        List<UpComingEntity> currentData = currentState.data;
        List<UpComingEntity> result = [...currentData, ...r];
        emit(UpComingSuccess(result, page: nextPage));
        refreshController.loadComplete();
      },
    );
  }
}
