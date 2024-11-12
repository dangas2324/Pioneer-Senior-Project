import 'dart:convert';
import 'package:app/widgets/Menu/bottom_select.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/Menu/menu.dart';
import 'package:flutter/services.dart' show rootBundle;

class LanguageOptions extends StatefulWidget {
  final String languageName;

  const LanguageOptions({super.key, required this.languageName});

  @override
  _LanguageOptionsState createState() => _LanguageOptionsState();
}

class _LanguageOptionsState extends State<LanguageOptions> {
  late Map<String, dynamic> languageData;

  @override
  void initState() {
    super.initState();
    _loadLanguageData(); // Load the language data based on the passed language name
  }

  // Function to load and parse the language data
  Future<void> _loadLanguageData() async {
    final String response = await rootBundle.loadString('lib/data.json');
    final data = json.decode(response);

    // Find the specific language data based on the selected language name
    final selectedLanguageData = data['languages'].firstWhere(
      (language) => language['name'] == widget.languageName,
      orElse: () => {}, // Provide a default empty map in case no match is found
    );

    setState(() {
      languageData = selectedLanguageData;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (languageData.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Loading...', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF07394B),
        ),
        body: const Center(child: CircularProgressIndicator()),
        bottomNavigationBar: const BottomSelect(),
      );
    }

    final languageName = languageData['name'];
    final studies = languageData['studies'] as List<dynamic>;
    final words = languageData['words'] as List<dynamic>;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF074A5F),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          languageName,
          style: const TextStyle(color: Colors.white),
        ),
        actions: const [
          Menu(),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100), // Add vertical spacing from the top AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/words',
                        arguments: words, // Pass words to the words page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF095A6D),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: const Text(
                      'View Words',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/selectStudy',
                        arguments: studies, // Pass studies to the studies page
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF095A6D),
                      padding: const EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: const Text(
                      'View Studies',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: studies.map<Widget>((study) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF095A6D),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(study['title']),
                    ),
                  );
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
