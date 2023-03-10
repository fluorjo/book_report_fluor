import 'dart:async';

import 'package:flutter/material.dart';
import 'package:book_report_fluor/models/model_auth.dart';
import 'package:book_report_fluor/models/model_shelf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final authClient =
        Provider.of<FirebaseAuthProvider>(context, listen: false);
    final shelfProvider = Provider.of<ShelfProvider>(context, listen: false);

    bool isLogin = prefs.getBool('isLogin') ?? false;
    String uid = prefs.getString('uid') ?? '';
    shelfProvider.fetchBookOrCreateShelf(uid);

    print("[*] 로그인 상태:$isLogin");

    if (isLogin) {
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');
      print("[*] 저장된 정보로 로그인 재시도");
      await authClient.loginWithEmail(email!, password!).then((loginStatus) {
        if (loginStatus == AuthStatus.loginSuccess) {
          print("[+] 로그인 성공");
        } else {
          print("[-] 로그인 실패");
          isLogin = false;
          prefs.setBool('isLogin', false);
        }
      });
    }

    return isLogin;
  }

  void moveScreen() async {
    await checkLogin().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacementNamed('/index');
        //index
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    moveScreen();
//    Timer(const Duration(milliseconds: 1500), () {
//      moveScreen();
//    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
