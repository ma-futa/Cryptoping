import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import 'login_page.dart';

class LandingPage extends StatelessWidget {
  static String route = "/LandingPageRoute";

  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Color.fromARGB(107, 192, 58, 43),
      backgroundColor: theme.backgroundColor,
      body: Center(
          child: PlayAnimation<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInCubic,
        child:
            LogoBanner(), //Container(height: 100, width: 100, color: Colors.amber),
        builder: (context, child, value) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
        onComplete: () => Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginPage(),
            transitionDuration: const Duration(seconds: 0),
          ),
        ),
      ) //LandingPage(),
          ),
    );
  }
}

class LogoBanner extends StatelessWidget {
  const LogoBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/pigeon.png',
          color: theme.primaryColor,
        ),
        Text(
          'Crypto Pigeon',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: theme.primaryColor),
        )
      ],
    );
  }
}
