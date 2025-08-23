import 'package:flutter/material.dart';

final class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Details'),
      ),
      body: const Center(
        child: Text('Details of the selected movie will be shown here.'),
      ),
    );
  }
}
