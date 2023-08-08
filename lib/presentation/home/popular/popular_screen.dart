import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_movie_app/core/widget/error_view_widget.dart';
import 'package:mvvm_movie_app/core/widget/progress_view_widget.dart';
import 'package:mvvm_movie_app/presentation/home/popular/popular_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/widget/movie_item_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.read<PopularCubit>()..getPopularMovies(),
      child: BlocBuilder<PopularCubit, PopularState>(
        builder: (context, state) {
          log("POPULAR_MOVIE_STATE $state");
          if (state is PopularSuccess) {
            log("POPULAR_MOVIE_SUCCESS ${state.data}");
            return SmartRefresher(
              onRefresh: () => context.read<PopularCubit>().getPopularMovies(),
              onLoading: () =>
                  context.read<PopularCubit>().getNextPopularMovies(),
              enablePullDown: true,
              enablePullUp: true,
              controller: PopularCubit.refreshController,
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
                    genreEntities: state.genres,
                  );
                },
              ),
            );
          } else if (state is PopularFailed) {
            log("POPULAR_MOVIE_FAILED ${state.error}");
            return ErrorViewWidget(
              message: state.error.message,
              onRetry: () {
                context.read<PopularCubit>().getPopularMovies();
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
