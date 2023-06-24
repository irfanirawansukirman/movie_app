import 'package:flutter/material.dart';
import 'package:mvvm_movie_app/core/app_route_path.dart';

class MovieItemWidget extends StatelessWidget {
  final String title;
  final int position;
  final int id;

  const MovieItemWidget({
    super.key,
    required this.id,
    required this.title,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutePath.movieDetail,
          arguments: {"id": id},
        );
      },
      child: Container(
        padding: EdgeInsets.all(
          16.0,
        ),
        color: position % 2 == 0 ? Colors.blue.shade50 : Colors.white,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
