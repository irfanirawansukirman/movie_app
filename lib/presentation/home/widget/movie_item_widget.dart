import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/core/app_route_path.dart';
import 'package:mvvm_movie_app/core/widget/progress_view_widget.dart';
import 'package:mvvm_movie_app/domain/entity/movie/genre_entity.dart';

class MovieItemWidget extends StatelessWidget {
  final String title;
  final int position;
  final int id;
  final String posterPath;
  final List<int> genreIds;
  final List<GenreEntity> genreEntities;

  const MovieItemWidget({
    super.key,
    required this.id,
    required this.title,
    required this.position,
    required this.posterPath,
    required this.genreIds,
    required this.genreEntities,
  });

  @override
  Widget build(BuildContext context) {
    log("MOVIE_ITEM $id GENRES ${_genresMapToUI(genreIds, genreEntities)}");
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutePath.movieDetail,
          arguments: {"id": id},
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: CachedNetworkImage(
          imageUrl: "https://image.tmdb.org/t/p/w342$posterPath",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const ProgressViewWidget(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  String _genresMapToUI(List<int> genreIds, List<GenreEntity> genreEntities) {
    try {
      List<String> uiGenres = [];
      for (int i = 0; i < genreIds.length; i++) {
        final result = genreEntities
            .where((element) => element.id == genreIds[i])
            .map((e) => e.name);
        uiGenres.add(result.first);
      }
      return uiGenres.join(", ");
    } catch (e) {
      return "-";
    }
  }
}
