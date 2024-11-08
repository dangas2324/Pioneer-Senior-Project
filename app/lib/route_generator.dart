import 'package:app/screens/screens.dart'; 
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
              data: args,
            )
          )
        }
        return _errorRoute();
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