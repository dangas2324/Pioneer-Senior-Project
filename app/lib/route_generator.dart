import 'package:app/screens/screens.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const StartPage());
        
      case '/selectLanguages':
        return MaterialPageRoute(builder: (_) => const LanguageSelection());
        
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case '/language':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => LanguageOptions(
              languageName: args,
            ),
          );
        }
        return _errorRoute();

      case '/selectStudy':
        if (args is List<dynamic>) {
          return MaterialPageRoute(
            builder: (_) => StudySetSelection(
              studies: args,
            ),
          );
        }
        return _errorRoute();      
      
      case '/words':
        // No longer needs arguments since it gets data from Firestore
        return MaterialPageRoute(
          builder: (_) => const WordSelection(),
        );

      case '/view':
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (_) => ViewWord(
              key: UniqueKey(),
              id: args['id'],
              ipaWord: args['ipaWord'],
              tradeWord: args['tradeWord'],
            ),
          );
        }
        return _errorRoute();
      
      case '/edit':
        if (args is Map<String, dynamic>) {
          return MaterialPageRoute(
            builder: (_) => AddEditWord(
              key: UniqueKey(),
              id: args['id'],
              initialIpaWord: args['ipaWord'],
              initialTradeWord: args['tradeWord'],
            ),
          );
        }
        return MaterialPageRoute(
          builder: (_) => const AddEditWord(), // For new words
        );

      case '/firebaseTest':
        return MaterialPageRoute(builder: (_) => const FirebaseTest());
        
      default:
        return _errorRoute();
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