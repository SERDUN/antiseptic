import 'package:antisepticks/core/configs/injection_container.dart';
import 'package:antisepticks/navigation/routest_const.dart';
import 'package:antisepticks/ui/features/antiseptic_list/antiseptic_list_page.dart';
import 'package:antisepticks/ui/features/feedback/presentation/bloc/feedback_bloc.dart';
import 'package:antisepticks/ui/features/feedback/presentation/feedback_page.dart';
import 'package:antisepticks/ui/features/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;

    switch (settings.name) {
      case RoutesPath.WELCOME_PAGE:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case RoutesPath.FEEDBACK:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  child: FeedbackPage(),
                  create: (ctx) => sl<FeedbackBloc>(),
                ));
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
