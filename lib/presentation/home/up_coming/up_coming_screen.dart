import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_movie_app/core/widget/error_view_widget.dart';
import 'package:mvvm_movie_app/core/widget/movie_item_widget.dart';
import 'package:mvvm_movie_app/core/widget/progress_view_widget.dart';
import 'package:mvvm_movie_app/injector.dart' as inject;
import 'package:mvvm_movie_app/presentation/home/up_coming/up_coming_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UpComingScreen extends StatelessWidget {
  const UpComingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject.locator<UpComingCubit>()..getUpComingMovies(),
      child: BlocBuilder<UpComingCubit, UpComingState>(
        builder: (context, state) {
          log("UP_COMING_MOVIE_STATE $state");
          if (state is UpComingSuccess) {
            log("UP_COMING_MOVIE_SUCCESS ${state.data}");
            return Container(
              color: Colors.white,
              child: SmartRefresher(
                onRefresh: () =>
                    context.read<UpComingCubit>()..getUpComingMovies(),
                onLoading: () =>
                    context.read<UpComingCubit>()..getNextUpComingMovies(),
                enablePullDown: true,
                enablePullUp: true,
                controller: UpComingCubit.refreshController,
                child: ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MovieItemWidget(
                      title: state.data[index].title,
                      position: index,
                      id: state.data[index].id,
                    );
                  },
                ),
              ),
            );
          } else if (state is UpComingFailed) {
            log("UP_COMING_MOVIE_FAILED ${state.errorEntity}");
            return const ErrorViewWidget();
          } else {
            return const ProgressViewWidget();
          }
        },
      ),
    );
  }
}
