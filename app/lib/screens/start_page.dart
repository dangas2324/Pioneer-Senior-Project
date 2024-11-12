import 'package:app/widgets/Menu/bottom_select.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/Menu/menu.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> languages = [
      'Spanish'
    ];
    //Change this to list of languages from Firestore

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF074A5F),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed('/login'); // Handle sign in/out action
            },
            child: const Text(
              'Sign In/Out',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const Menu(),
        ],
      ),
      backgroundColor: Colors.white, // Set background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50), // Add vertical spacing here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/selectLanguages');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF095A6D), // Button background color
                    foregroundColor: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20), // Increased height
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Slightly rounded corners
                    ),
                  ),
                  child: const Text('View All Languages'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Most Recent',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  for (var language in languages)

                    //Might need to change these to LanguageButtons in language_selection
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal:
                              80), // Increased horizontal padding to make buttons smaller in length
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            '/language',
                            arguments: language,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF095A6D),
                          foregroundColor: Colors.white, // Text color
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(language),
                        ),
                      ),
                    ),
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
