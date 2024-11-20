import 'package:app/screens/screens.dart';
import 'package:app/widgets/Menu/bottom_select.dart';
import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class StudySetSelection extends StatelessWidget {
  final List<dynamic> studies; // Expecting a list of studies

  const StudySetSelection({super.key, required this.studies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
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
            // Study Set Buttons based on studies passed
            Expanded(
              child: ListView(
                children: studies.map<Widget>((study) {
                  return StudySetButton(studyName: study['title']);
                }).toList(),
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