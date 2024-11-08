import 'package:app/screens/screens.dart';
import 'package:app/screens/word_selection.dart'; 
import 'package:flutter/material.dart';

//https://www.youtube.com/watch?v=nyvwx7o277U

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;  
    
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => StartPage());
      case '/selectLanguages':
        return MaterialPageRoute(builder: (_) => LanguageSelection());
      case '/language':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => LanguageOptions(
              key: UniqueKey(),
              data: args,
            )
          );
        }
        return _errorRoute();
      case '/words':
        return MaterialPageRoute(builder: (_) => WordSelection());
      case '/view':
        if (args is ViewWordArguments) {
          return MaterialPageRoute(
            builder: (_) => ViewWord(
              key: UniqueKey(),
              ipaWord: args.ipaWord,
              tradeWord: args.tradeWord,
            )
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
            )
          );
        }
        return _errorRoute();
      case '/selectStudy':
        return MaterialPageRoute(builder: (_) => StudySetSelection());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}