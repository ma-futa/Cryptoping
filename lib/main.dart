import 'package:crypto_ping_v1/pages/landing_page.dart';
import 'package:crypto_ping_v1/pages/login_page.dart';
import 'package:crypto_ping_v1/pages/my_alerts.dart';
import 'package:crypto_ping_v1/pages/profile_page.dart';
import 'package:crypto_ping_v1/pages/set_alert_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(129, 44, 62, 80)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isdark = true;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        backgroundColor: Color.fromARGB(129, 44, 62, 80),
        primaryColor: Color.fromARGB(255, 88, 121, 154),
        hintColor: Colors.white,
      ),
      theme: ThemeData(
        backgroundColor: Color(0xFFecf0f1),
        primaryColor: Color.fromARGB(255, 88, 121, 154),
        hintColor: Colors.black,
      ),
      home: LandingPage(),
      routes: {
        LandingPage.route: (context) => const LandingPage(),
        LoginPage.route: (context) => const LoginPage(),
        MyAlerts.route: (context) => const MyAlerts(),
        SetAlertPage.route: (context) => const SetAlertPage(),
        ProfilePage.route: (context) => const ProfilePage(),
      },
    );
  }
}
