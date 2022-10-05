import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import 'package:crypto_ping_v1/pages/my_alerts.dart';

import '../models/user_model.dart';
import '../providers/load_provider.dart';
import '../providers/user_provider.dart';
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
      body: Stack(
        children: [
          Center(
              child: PlayAnimation<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInCubic,
            child:
                const LogoBanner(), //Container(height: 100, width: 100, color: Colors.amber),
            builder: (context, child, value) {
              return Opacity(
                opacity: value,
                child: child,
              );
            },
            onComplete: () async {
              final isSignedin = await checkIfSignedIn(context);
              if (isSignedin) {
                await loadCurrentUser(context);
                Navigator.of(context).pushReplacementNamed(MyAlerts.route);
              } else {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LoginPage(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              }
            },
          ) //LandingPage(),
              ),

          if (Provider.of<LoadProvider>(context).getIsLoading)
            Center(
              child: Transform.translate(
                offset: Offset(0, 100),
                child: CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              ),
            )
          // Container(
          //   decoration:
          //       BoxDecoration(color: theme.primaryColor.withOpacity(0.2)),

          // )
        ],
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

Future<bool> checkIfSignedIn(BuildContext context) async {
  var isLoading = Provider.of<LoadProvider>(context, listen: false);
  try {
    isLoading.setIsLoading();
    final result = await Amplify.Auth.fetchAuthSession();
    isLoading.setIsLoading();
    return result.isSignedIn;
  } on AuthException catch (e) {
    print(e.message);
    isLoading.setIsLoading();
    return false;
  }
}

Future<void> loadCurrentUser(BuildContext context) async {
  try {
    final currentUser = await Amplify.Auth.getCurrentUser();
    final attributes = await Amplify.Auth.fetchUserAttributes();

    print(
        '${currentUser.username} xxxxxx ${attributes[4].value} xxxxxx ${attributes[3].value}');
    Provider.of<UserProvider>(context, listen: false).setUser(UserModel(
        id: currentUser.userId,
        name: currentUser.username,
        email: attributes[4].value,
        number: attributes[3].value));
  } on AuthException catch (e) {
    print(e.message);
  }
}
