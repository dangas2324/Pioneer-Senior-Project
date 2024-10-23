import 'package:flutter/material.dart';

class StudySetSelection extends StatelessWidget {
  const StudySetSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Set Selection'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Study Set Selection!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
