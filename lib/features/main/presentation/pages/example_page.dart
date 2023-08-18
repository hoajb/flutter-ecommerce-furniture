import 'package:flutter/material.dart';

class ExamplePage extends StatelessWidget {
  final String titlePage;
  final bool isNested;

  const ExamplePage(
      {super.key, required this.titlePage, this.isNested = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isNested
          ? null
          : AppBar(
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
