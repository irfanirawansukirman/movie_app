import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_movie_app/core/widget/error_view_widget.dart';
import 'package:mvvm_movie_app/core/widget/progress_view_widget.dart';
import 'package:mvvm_movie_app/presentation/home/top_rated/top_rated_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/widget/movie_item_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TopRatedScreen extends StatelessWidget {
  const TopRatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.read<TopRatedCubit>()..getTopRatedMovies(),
      child: BlocBuilder<TopRatedCubit, TopRatedState>(
        builder: (context, state) {
          log("TOP_RATED_MOVIE_STATE $state");
          if (state is TopRatedSuccess) {
            log("TOP_RATED_MOVIE_SUCCESS ${state.data}");
            return SmartRefresher(
              onRefresh: () =>
                  context.read<TopRatedCubit>().getTopRatedMovies(),
              onLoading: () =>
                  context.read<TopRatedCubit>().getNextTopRatedMovies(),
              enablePullDown: true,
              enablePullUp: true,
              controller: TopRatedCubit.refreshController,
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 3,
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: state.data.length,
                itemBuilder: (BuildContext ctx, index) {
                  return MovieItemWidget(
                    title: state.data[index].title,
                    position: index,
                    id: state.data[index].id,
                    posterPath: state.data[index].posterPath,
                    genreIds: state.data[index].genreIds,
                    genreEntities: [],
                  );
                },
              ),
            );
          } else if (state is TopRatedFailed) {
            log("TOP_RATED_MOVIE_FAILED ${state.error}");
            return ErrorViewWidget(
              message: state.error.message,
              onRetry: () {
                context.read<TopRatedCubit>().getTopRatedMovies();
              },
            );
          } else {
            return const ProgressViewWidget();
          }
        },
      ),
    );
  }
}
