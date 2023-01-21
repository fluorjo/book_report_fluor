import 'package:flutter/material.dart';
import 'package:book_report_fluor/screens/screens_detail.dart';
import 'package:book_report_fluor/screens/screens_index.dart';
import 'package:book_report_fluor/screens/screens_login.dart';
import 'package:book_report_fluor/screens/screens_register.dart';
import 'package:book_report_fluor/screens/screens_search.dart';
import 'package:book_report_fluor/screens/screens_splash.dart';

import 'package:book_report_fluor/models/model_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:book_report_fluor/models/model_shelf.dart';

import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (_) => ShelfProvider()),
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
        ChangeNotifierProvider(create: (_) => FirebaseAuthProvider()),
      ],
      child: MaterialApp(
        title: 'Book Report',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/index': (context) => IndexScreen(),
          '/register': (context) => RegisterScreen(),
          '/search': (context) => SearchScreen(),
          '/detail': (context) => DetailScreen(),
//          '/bookDetail': (context) => bookDetailScreen(),
        },
        initialRoute: '/',
      ),
    );
  }
}
