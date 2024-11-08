import 'package:app/route_generator.dart';
import 'package:flutter/material.dart';

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
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
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
          /*children: <Widget>[
            _buildButton(context, 'Start Page', const StartPage()),
            _buildButton(context, 'Menu', const Menu()),
            _buildButton(context, 'Language Options', const LanguageOptions()),
            _buildButton(
                context, 'Language Selection', const LanguageSelection()),
            _buildButton(
                context, 'Study Set Selection', const StudySetSelection()),
            _buildButton(context, 'Study Set Options', const StudySetOptions()),
            _buildButton(context, 'Word Selection', const WordSelection()),
            _buildButton(context, 'Add Word', const ViewWord()),
            _buildButton(context, 'Edit Word', const EditWord()),
          ],*/
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

  const PlaceholderPage({super.key, required this.message});

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
