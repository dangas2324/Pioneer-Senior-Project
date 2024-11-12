import 'package:app/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const StartPage());
      case '/selectLanguages':
        return MaterialPageRoute(builder: (_) => const LanguageSelection()); // LanguageSelection Route
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());

      // For the /language route, passing the language name to LanguageOptions
      case '/language':
        if (args is String) { // The language name is passed here
          return MaterialPageRoute(
            builder: (_) => LanguageOptions(
              languageName: args, // Using the passed language name
            ),
          );
        }
        return _errorRoute();

      case '/selectStudy':
        if (args is List<dynamic>) { // Expecting the studies list as arguments
          return MaterialPageRoute(
            builder: (_) => StudySetSelection(
              studies: args, // Passing the studies list to the StudySetSelection page
            ),
          );
        }
        return _errorRoute();      
      
      case '/words':
        if (args is List<dynamic>) { // Expecting the studies list as arguments
          return MaterialPageRoute(
            builder: (_) => WordSelection(
              words: args, // Passing the studies list to the StudySetSelection page
            ),
          );
        }
        return _errorRoute();      

      
      case '/view':
        if (args is ViewWordArguments) {
          return MaterialPageRoute(
            builder: (_) => ViewWord(
              key: UniqueKey(),
              ipaWord: args.ipaWord,
              tradeWord: args.tradeWord,
            ),
          );
        }
        return _errorRoute();
      
      case '/edit':
        if (args is EditWordArguments) {
          return MaterialPageRoute(
            builder: (_) => AddEditWord(
              key: UniqueKey(),
              ipaWord: args.ipaWord,
              tradeWord: args.tradeWord,
            ),
          );
        }
        return _errorRoute();


      case '/firebaseTest':
        return MaterialPageRoute(builder: (_) => const FirebaseTest());
      default:
        return _errorRoute(); // Default error route
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
