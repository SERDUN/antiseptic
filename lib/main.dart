import 'package:flutter/material.dart';

import 'screens/antiseptic_list/antiseptic_list_page.dart';

void main() => runApp(MyApp());

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
      home: AntisepticList(),
    );
  }
}
