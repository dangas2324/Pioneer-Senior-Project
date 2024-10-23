import 'package:flutter/material.dart';

class AddWord extends StatelessWidget {
  const AddWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Word'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to Add Word!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
