import 'dart:convert';
import 'package:app/widgets/Menu/bottom_select.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/Menu/menu.dart';
import 'package:flutter/services.dart' show rootBundle; 

class LanguageSelection extends StatefulWidget {
  const LanguageSelection({super.key});

  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  List<String> languages = []; // List to hold language names

  @override
  void initState() {
    super.initState();
    _loadLanguages(); // Load languages when the widget is initialized
  }

  // Function to load and parse JSON data
  Future<void> _loadLanguages() async {
    final String response = await rootBundle.loadString('lib/data.json');
    final data = json.decode(response);

    setState(() {
      languages = List<String>.from(
        data['languages'].map((language) => language['name']),
      );
    });
  }

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
          'Languages',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF07394B),
        actions: const [
          Menu(),
        ],
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
                  hintText: 'Search languages...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Language Buttons
            Expanded(
              child: languages.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        return LanguageButton(
                          language: languages[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomSelect(),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String language;
  const LanguageButton({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/language',
            arguments: language,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF095A6D),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          language,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
