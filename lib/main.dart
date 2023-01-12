import 'package:flutter/material.dart';
import 'package:book_report_fluor/screens/screens_index.dart';
import 'package:book_report_fluor/screens/screens_login.dart';
import 'package:book_report_fluor/screens/screens_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Report',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/index': (context) => IndexScreen(),
      },
      initialRoute: '/',
    );
  }
}
