import 'package:flutter/material.dart';

class LanguageOptions extends StatelessWidget {
  const LanguageOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Options'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Language Options!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
