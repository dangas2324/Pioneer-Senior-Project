import 'package:flutter/material.dart';

class LanguageOptions extends StatelessWidget {
  const LanguageOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF074A5F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
        title: const Text(
          'Language_Name',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100), // Add vertical spacing from the top AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150, // Set a fixed width for the buttons
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for 'View Words' button
                    },
                    child: const Text(
                      'View Words',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF095A6D), // Button background color
                      padding: const EdgeInsets.symmetric(vertical: 20), // Adjusted padding
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Add spacing between the buttons
                SizedBox(
                  width: 150, // Set the same fixed width for the buttons
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for 'Study' button
                    },
                    child: const Text(
                      'View Studies',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF095A6D),
                      padding: const EdgeInsets.symmetric(vertical: 20), // Adjusted padding
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  for (var study in ['Recent Study 1', 'Recent Study 2'])
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80), // Increased horizontal padding to make buttons smaller in length
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(6.0), // Adjusted padding here
                          child: Text(study),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF095A6D),
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Adjusted padding here
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Slightly rounded corners
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}