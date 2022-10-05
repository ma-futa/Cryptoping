import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:crypto_ping_v1/providers/load_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:crypto_ping_v1/pages/landing_page.dart';
import 'package:crypto_ping_v1/pages/login_page.dart';
import 'package:crypto_ping_v1/pages/my_alerts.dart';
import 'package:crypto_ping_v1/pages/profile_page.dart';
import 'package:crypto_ping_v1/pages/set_alert_page.dart';
import 'package:crypto_ping_v1/providers/theme_provider.dart';
import 'package:crypto_ping_v1/providers/user_provider.dart';

import 'package:amplify_datastore/amplify_datastore.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(129, 44, 62, 80)));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    // Add any Amplify plugins you want to use
    final auth = AmplifyAuthCognito();
    final api = AmplifyAPI();
    final datastore = AmplifyDataStore(modelProvider: ModelProvider.instance);
    await Amplify.addPlugins([
      api,
      auth,
      datastore,
    ]);

    // You can use addPlugins if you are going to be adding multiple plugins
    // await Amplify.addPlugins([authPlugin, analyticsPlugin]);

    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<LoadProvider>(
          create: (context) => LoadProvider(),
        ),
      ],
      child: const MainMaterialApp(),
    );
  }
}

class MainMaterialApp extends StatelessWidget {
  const MainMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<ThemeProvider>(context).getThemeValue
          ? ThemeMode.light
          : ThemeMode.dark,
      darkTheme: ThemeData(
        backgroundColor: const Color.fromARGB(129, 44, 62, 80),
        primaryColor: const Color.fromARGB(255, 88, 121, 154),
        hintColor: Colors.white,
      ),
      theme: ThemeData(
        backgroundColor: const Color(0xFFecf0f1),
        primaryColor: const Color.fromARGB(255, 88, 121, 154),
        hintColor: Colors.black,
      ),
      home: const LandingPage(),
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
