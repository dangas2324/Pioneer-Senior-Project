import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

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
        actions: [
          TextButton(
        onPressed: () {
          // Handle sign in/out action
        },
        child: const Text(
          'Sign In/Out',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
          ),
            IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Handle settings action
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFD8D4D1), // Set background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Add vertical spacing here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('View All Languages'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF095A6D), // Button background color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20), // Increased height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Slightly rounded corners
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView(
              children: [
                for (var language in ['Any Language','Spanish', 'French', 'German', 'Chinese', 'Japanese', 'French'])
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80), // Increased horizontal padding to make buttons smaller in length
                  child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(6.0), // Adjusted padding here
                    child: Text(language),
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
