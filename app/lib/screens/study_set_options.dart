import 'package:flutter/material.dart';

class StudySetOptions extends StatelessWidget {
  const StudySetOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Set Options'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Study Set Options!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
