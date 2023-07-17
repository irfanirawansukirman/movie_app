import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_movie_app/core/widget/error_view_widget.dart';
import 'package:mvvm_movie_app/core/widget/progress_view_widget.dart';
import 'package:mvvm_movie_app/injector.dart' as inject;
import 'package:mvvm_movie_app/presentation/movie_detail/movie_detail_cubit.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;

  const MovieDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    log("MOVIE_DETAIL_ID $id");
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Detail"),
      ),
      body: BlocProvider(
        create: (_) => inject.locator<MovieDetailCubit>()..getMovieDetail(id),
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailSuccess) {
              return Text(state.data.title);
            } else if (state is MovieDetailFailed) {
              return ErrorViewWidget(
                message: state.error.message,
                onRetry: () {
                  context.read<MovieDetailCubit>().getMovieDetail(id);
                },
              );
            } else {
              return const ProgressViewWidget();
            }
          },
        ),
      ),
    );
  }
}
