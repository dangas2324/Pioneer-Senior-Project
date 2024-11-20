import 'package:flutter/material.dart';
import 'package:app/widgets/Menu/bottom_select.dart';
import 'package:app/screens/screens.dart';

class WordSelection extends StatelessWidget {
  final List<dynamic> words; // Expecting a list of words

  const WordSelection({super.key, required this.words});

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
          'Words',
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
                  hintText: 'Search words...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Word Buttons
            Expanded(
              child: ListView.builder(
                itemCount: words.length, // The number of words to display
                itemBuilder: (context, index) {
                  var word = words[index];
                  return WordButton(
                    ipaWord: word['text'], // The word itself (IPA word)
                    translatedWord: word['translation'], // The translation
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

class WordButton extends StatelessWidget {
  final String ipaWord;
  final String translatedWord;

  const WordButton(
      {super.key, required this.ipaWord, required this.translatedWord});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            '/view',
            arguments: ViewWordArguments(ipaWord, translatedWord),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF095A6D), // Background color
          foregroundColor: Colors.white, // Text color
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Add padding to the left side of the text
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0), // Adds space from the left edge
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ipaWord,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    translatedWord,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors
                          .white70, // Smaller and lighter text for translation
                    ),
                  ),
                ],
              ),
            ),
            // Icons for audio and edit
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.volume_up, color: Colors.white),
                  onPressed: () {}, // Audio play button
                ),
                IconButton(
                  icon: const Icon(Icons.edit, color: Color(0xFFF9BAA5)),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      '/edit',
                      arguments: EditWordArguments(ipaWord, translatedWord),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
