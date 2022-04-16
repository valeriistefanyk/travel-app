import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/detail_page.dart';
import 'screens/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DetailPage(),
    );
  }
}
