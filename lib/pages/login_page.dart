import 'package:crypto_ping_v1/pages/landing_page.dart';
import 'package:crypto_ping_v1/pages/set_alert_page.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String route = '/LoginPageRoute';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
          child: Stack(
        // mainAxisSize: MainAxisSize.min,
        alignment: Alignment.center,
        children: [
          PlayAnimation<double>(
            delay: Duration(milliseconds: 200),
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            builder: (context, child, value) => Transform.translate(
              offset: Offset(0, value * -260),
              child: LogoBanner(),
            ),
          ),
          PlayAnimation<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            builder: (context, child, value) => Opacity(
              opacity: value,
              child: Container(
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 3, color: theme.primaryColor),
                ),
                padding: EdgeInsets.all(20),
                child: LoginWidget(),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        if (!isLogin)
          const TextField(
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
        const TextField(
          decoration: InputDecoration(
            hintText: "Email",
          ),
        ),
        if (!isLogin)
          const TextField(
            decoration: InputDecoration(
              hintText: "Number",
            ),
          ),
        const TextField(
          decoration: InputDecoration(
            hintText: "Password",
          ),
        ),
        SizedBox(
          height: 15,
        ),
        if (isLogin)
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(SetAlertPage.route);
            },
            child: Text("Login"),
            style: ElevatedButton.styleFrom(primary: theme.primaryColor),
          ),
        if (!isLogin)
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(SetAlertPage.route);
            },
            child: Text("sign up"),
            style: ElevatedButton.styleFrom(primary: theme.primaryColor),
          ),
        const Spacer(),
        if (isLogin)
          TextButton(
              onPressed: () => setState(() {
                    isLogin = false;
                  }),
              child: Text(
                "Dont have an account, create one",
                style: TextStyle(color: theme.primaryColor),
              )),
        if (!isLogin)
          TextButton(
              onPressed: () => setState(() {
                    isLogin = true;
                  }),
              child: Text(
                "Already have an account, sign in",
                style: TextStyle(color: theme.primaryColor),
              )),
      ],
    );
  }
}
