import 'dart:developer';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_movie_app/core/widget/error_view_widget.dart';
import 'package:mvvm_movie_app/core/widget/movie_item_widget.dart';
import 'package:mvvm_movie_app/core/widget/progress_view_widget.dart';
import 'package:mvvm_movie_app/injector.dart' as inject;
import 'package:mvvm_movie_app/presentation/home/popular/popular_cubit.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject.locator<PopularMovieCubit>()..getPopularMovies(),
      child: BlocBuilder<PopularMovieCubit, PopularState>(
        builder: (context, state) {
          log("POPULAR_MOVIE_STATE $state");
          if (state is PopularSuccess) {
            log("POPULAR_MOVIE_SUCCESS ${state.data}");
            return Container(
              color: Colors.white,
              child: SmartRefresher(
                onRefresh: () =>
                    context.read<PopularMovieCubit>()..getPopularMovies(),
                onLoading: () =>
                    context.read<PopularMovieCubit>()..getNextPopularMovies(),
                enablePullDown: true,
                enablePullUp: true,
                controller: PopularMovieCubit.refreshController,
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
          } else if (state is PopularFailed) {
            log("POPULAR_MOVIE_FAILED ${state.errorEntity}");
            return const ErrorViewWidget();
          } else {
            return const ProgressViewWidget();
          }
        },
      ),
    );
  }
}
