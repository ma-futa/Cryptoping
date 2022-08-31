import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/play_animation.dart';

import 'package:crypto_ping_v1/pages/landing_page.dart';
import 'package:crypto_ping_v1/pages/my_alerts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String route = '/LoginPageRoute';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = false;
  late PageController _horizontalPageController;

  @override
  initState() {
    super.initState();
    _horizontalPageController = PageController(initialPage: 0);
  }

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
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _horizontalPageController,
                          children: [
                            SignupWidget(),
                            LoginWidget(),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            isLogin = _horizontalPageController.page == 0;
                            _horizontalPageController.animateToPage(
                                isLogin ? 1 : 0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: isLogin
                              ? Text("Dont have an account, create one",
                                  style: TextStyle(color: theme.primaryColor))
                              : Text(
                                  "Already have an account, sign in",
                                  style: TextStyle(color: theme.primaryColor),
                                )),
                    ],
                  )),
            ),
          ),
        ],
      )),
    );
  }
}

class SignupWidget extends StatefulWidget {
  const SignupWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
// Create a boolean for checking the sign up status
  bool isSignUpComplete = false;
  late PageController _verticalPageController;
  final _formKey = GlobalKey<FormState>();
  final _confirmationCodeController = TextEditingController();

  String _name = '';
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _verticalPageController = PageController(initialPage: 0);
  }

  Future<void> signUpUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: _email,
        //CognitoUserAttributeKey.phoneNumber: '+15559101234',
        // additional attributes as needed
      };
      print('xxxxxxxxxxxxx1');
      print(userAttributes.toString());
      final result = await Amplify.Auth.signUp(
        username: _name,
        password: _password,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      setState(() {
        isSignUpComplete = result.isSignUpComplete;
      });
    } on AuthException catch (e) {
      print(e.message);
    }
    print('xxxxxxxxxxxxx33');
    _verticalPageController.animateToPage(1,
        duration: Duration(microseconds: 300), curve: Curves.easeIn);
  }

  Future<void> confirmUser() async {
    try {
      print('xxxxxxxxxxxxx34');
      final result = await Amplify.Auth.confirmSignUp(
          username: _name, confirmationCode: _confirmationCodeController.text);
      print('xxxxxxxxxxxxx4');
      setState(() {
        isSignUpComplete = result.isSignUpComplete;
      });
    } on AuthException catch (e) {
      print(e.message);
    }
    print('xxxxxxxxxxxxx5');
    await loadCurrentUser(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      controller: _verticalPageController,
      children: [
        Form(
          key: _formKey,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: ((value) {
                  if (value == null) {
                    return 'Please provide a name';
                  }
                }),
                onSaved: (newValue) {
                  _name = newValue!;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              TextFormField(
                validator: ((value) {
                  if (value == null) {
                    return 'Please provide an email';
                  }
                }),
                onSaved: (newValue) {
                  _email = newValue!;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null) {
                    return 'Please provide a password';
                  }
                  if (value.length < 7) {
                    return 'Password should be minimum 7 characters';
                  }
                },
                onSaved: (value) {
                  _password = value!;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  await signUpUser();
                },
                child: Text("sign up"),
                style: ElevatedButton.styleFrom(primary: theme.primaryColor),
              ),
              const Spacer(),

              // TextButton(
              //     onPressed: () => setState(() {
              //           isLogin = true;
              //         }),
              //     child: Text(
              //       "Already have an account, sign in",
              //       style: TextStyle(color: theme.primaryColor),
              //     )),
            ],
          ),
        ),
        Column(
          children: [
            TextField(
              controller: _confirmationCodeController,
              decoration: InputDecoration(
                hintText: "Confirmation code",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await confirmUser();
                Navigator.of(context).pushReplacementNamed(MyAlerts.route);
              },
              style: ElevatedButton.styleFrom(primary: theme.primaryColor),
              child: Text("Confirm"),
            )
          ],
        )
      ],
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
// Create a boolean for checking the sign in status
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _password = "";

  Future<void> signInUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      final result = await Amplify.Auth.signIn(
        username: _name,
        password: _password,
      );
    } on AuthException catch (e) {
      print(e.message);
    }
    final result = await Amplify.Auth.fetchUserAttributes();
    print(result[0]);
    await loadCurrentUser(context);
    Navigator.of(context).pushReplacementNamed(MyAlerts.route);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            validator: ((value) {
              if (value == null) {
                return 'Please provide a name';
              }
            }),
            onSaved: (newValue) {
              _name = newValue!;
            },
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
          TextFormField(
            validator: (value) {
              if (value == null) {
                return 'Please provide a password';
              }
              if (value.length < 7) {
                return 'Password should be minimum 7 characters';
              }
            },
            onSaved: (value) {
              _password = value!;
            },
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async => await signInUser(),
            child: Text("Login"),
            style: ElevatedButton.styleFrom(primary: theme.primaryColor),
          ),
          const Spacer(),
          // TextButton(
          //     onPressed: () => setState(() {
          //           isLogin = false;
          //         }),
          //     child: Text(
          //       "Dont have an account, create one",
          //       style: TextStyle(color: theme.primaryColor),
          //     )),

          // TextButton(
          //     onPressed: () => setState(() {
          //           isLogin = true;
          //         }),
          //     child: Text(
          //       "Already have an account, sign in",
          //       style: TextStyle(color: theme.primaryColor),
          //     )),
        ],
      ),
    );
  }
}

// class ConfirmationWidget extends StatelessWidget {
//   const ConfirmationWidget({
//     Key? key,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Column(
//       children: [
//         const TextField(
//           decoration: InputDecoration(
//             hintText: "Confirmation number",
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () =>
//               Navigator.of(context).pushReplacementNamed(MyAlerts.route),
//           style: ElevatedButton.styleFrom(primary: theme.primaryColor),
//           child: Text("Login"),
//         )
//       ],
//     );
//   }
// }


//pass verticalpagecontroller into signup and signin, so that when an action occures, to moves down toconfirmation