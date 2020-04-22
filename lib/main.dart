import 'package:antisepticks/navigation/routest_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/configs/injection_container.dart' as di;
import 'navigation/route_generator.dart';

void main() async {
  BlocSupervisor.delegate = BlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 32.0),
          subtitle:
              TextStyle(fontSize: 14.0, color: Colors.grey.withOpacity(0.7)),
        ),
      ),
      initialRoute: RoutesPath.WELCOME_PAGE,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
