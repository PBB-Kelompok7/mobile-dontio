// main.dart

import 'login.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'register.dart';
import 'splash_screen_2.dart';
import 'landing_page.dart';
import 'detail.dart';
import 'payment.dart';
import 'method.dart';
import 'scan.dart';
import 'history.dart';
import 'account.dart';
import 'edit.dart';
import 'tentang.dart';
import 'term.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dontio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
        '/login': (context) => loginPage(),
        '/splash2': (context) => SplashScreen2(),
        '/landing': (context) => LandingPage(),
        '/detail': (context) => DetailPage(),
        '/payment': (context) => PaymentPage(),
        '/method': (context) => MethodPage(),
        '/scan': (context) => ScanPage(),
        '/history': (context) => HistoryPage(),
        '/account': (context) => AccountPage(),
        '/edit': (context) => EditPage(
              name: '',
              dob: '',
              email: '',
            ),
        '/tentang': (context) => TentangPage(),
        '/term': (context) => TermPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 24, color: Colors.blue),
        ),
      ),
    );
  }
}
