import 'package:flutter/material.dart';

class ViewWord extends StatelessWidget {
  const ViewWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Word'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to View Word!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
