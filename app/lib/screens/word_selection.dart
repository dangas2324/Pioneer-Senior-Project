import 'package:flutter/material.dart';

class WordSelection extends StatelessWidget {
  const WordSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Selection'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Word Selection!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
