import 'dart:developer';

import 'package:flutter/material.dart';

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
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
