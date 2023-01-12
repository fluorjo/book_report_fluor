import 'package:flutter/material.dart';
import 'package:book_report_fluor/screens/screens_detail.dart';
import 'package:book_report_fluor/screens/screens_index.dart';
import 'package:book_report_fluor/screens/screens_login.dart';
import 'package:book_report_fluor/screens/screens_register.dart';
import 'package:book_report_fluor/screens/screens_search.dart';
import 'package:book_report_fluor/screens/screens_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Report',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/index': (context) => IndexScreen(),
        '/register': (context) => RegisterScreen(),
        '/search': (context) => SearchScreen(),
        '/detail': (context) => DetailScreen(),
      },
      initialRoute: '/',
    );
  }
}
