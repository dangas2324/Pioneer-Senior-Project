import 'package:app/screens/screens.dart';
import 'package:app/widgets/Menu/bottom_select.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class StudySetSelection extends StatelessWidget {
  const StudySetSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Back icon
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
        title: const Text(
          'Study Set',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF07394B),
        actions: const [Menu()],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search study sets...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Study Set Buttons
            Expanded(
              child: ListView(
                children: const [
                  StudySetButton(studyName: 'Math 101'),
                  StudySetButton(studyName: 'Biology Basics'),
                  StudySetButton(studyName: 'World History'),
                  StudySetButton(studyName: 'Physics Principles'),
                  StudySetButton(studyName: 'Chemistry Concepts'),
                  StudySetButton(studyName: 'Programming Fundamentals'),
                  StudySetButton(studyName: 'Art History'),
                  StudySetButton(studyName: 'Business Management'),
                  // Add more study sets as needed
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomSelect(),      
    );
  }
}

class StudySetButton extends StatelessWidget {
  final String studyName;

  const StudySetButton({super.key, required this.studyName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {}, // Button is not functional but appears active
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF095A6D), // Background color
          foregroundColor: Colors.white, // Text color
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          studyName,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

//Daniel Gaskins