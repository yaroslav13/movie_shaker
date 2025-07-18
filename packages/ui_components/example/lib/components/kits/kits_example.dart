import 'package:flutter/material.dart';

final class KitsExample extends StatefulWidget {
  const KitsExample({super.key});

  @override
  State<KitsExample> createState() => _KitsExampleState();
}

final class _KitsExampleState extends State<KitsExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        ),
      ),
    );
  }
}
