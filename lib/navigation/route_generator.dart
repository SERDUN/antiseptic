import 'package:antisepticks/navigation/routest_const.dart';
import 'package:antisepticks/screens/antiseptic_list/antiseptic_list_page.dart';
import 'package:antisepticks/screens/feedback/feedback_page.dart';
import 'package:antisepticks/screens/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case RoutesPath.WELCOME_PAGE:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case RoutesPath.FEEDBACK:
        return MaterialPageRoute(builder: (_) => FeedbackPage());
      case RoutesPath.ANTISEPTIC_LIST:
        return MaterialPageRoute(builder: (_) => AntisepticList());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Container(
                child: Text("Error"),
              ),
            ));
  }
}
