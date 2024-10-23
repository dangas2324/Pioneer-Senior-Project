import 'package:app/screens/add_word.dart';
import 'package:app/screens/edit_word.dart';
import 'package:app/screens/language_options.dart';
import 'package:app/screens/language_selection.dart';
import 'package:app/screens/study_set_options.dart';
import 'package:app/screens/study_set_selection.dart';
import 'package:app/screens/word_selection.dart';
import 'package:flutter/material.dart';

import 'screens/start_page.dart'; // Import Start Page page
import 'screens/menu.dart'; // Import Menu page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3, // 3 buttons per row
          children: <Widget>[
            _buildButton(context, 'Start Page', const StartPage()),
            _buildButton(context, 'Menu', const Menu()),
            _buildButton(context, 'Language Options Page', const LanguageOptions()),
            _buildButton(context, 'Language Selection Page', const LanguageSelection()),
            _buildButton(context, 'Study Set Selection Page', const StudySetSelection()),
            _buildButton(context, 'Study Set Options Page', const StudySetOptions()),
            _buildButton(context, 'Word Selection Page', const WordSelection()),
            _buildButton(context, 'Add Word Selection', const AddWord()),
            _buildButton(context, 'Edit Word Selection', const EditWord()),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Text(title),
    );
  }
}


class PlaceholderPage extends StatelessWidget {
  final String message;

  const PlaceholderPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(message),
      ),
      body: Center(
        child: Text(message, style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
