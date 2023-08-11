import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  final String titlePage;

  const ExamplePage({super.key, required this.titlePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlePage),
      ),
      body: Center(
        child: Text(
          'Welcome to the $titlePage Page',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
