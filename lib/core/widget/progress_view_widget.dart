import 'package:flutter/material.dart';

class ProgressViewWidget extends StatelessWidget {
  const ProgressViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
