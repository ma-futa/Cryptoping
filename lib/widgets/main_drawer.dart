import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/landing_page.dart';
import '../pages/my_alerts.dart';
import '../pages/profile_page.dart';
import '../pages/set_alert_page.dart';
import '../providers/theme_provider.dart';
import '../providers/user_provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    print(ModalRoute.of(context)?.settings.name);
    return Drawer(
        width: 150,
        child: Container(
          color: theme.primaryColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 200),
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ProfilePage.route),
                    icon: const Icon(Icons.account_circle),
                    iconSize: 45),
                const Text('Welcome back'),
                Text(Provider.of<UserProvider>(context).getUser.name),
                const SizedBox(height: 20),
                if (ModalRoute.of(context)?.settings.name ==
                    "/SetAlertPageRoute")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () =>
                        Navigator.of(context).popAndPushNamed(MyAlerts.route),
                    child: const Text('My Alerts',
                        style: TextStyle(color: Colors.white)),
                  ),
                if (ModalRoute.of(context)?.settings.name == "/MyAlertsRoute")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () => Navigator.of(context)
                        .popAndPushNamed(SetAlertPage.route),
                    child: const Text('Set Alerts',
                        style: const TextStyle(color: Colors.white)),
                  ),
                const SizedBox(height: 20),
                ToggleButtons(
                    borderRadius: BorderRadius.circular(30),
                    selectedColor: Colors.black,
                    fillColor: theme.backgroundColor,
                    isSelected: [
                      Provider.of<ThemeProvider>(context).getThemeValue,
                      !Provider.of<ThemeProvider>(context).getThemeValue
                    ],
                    onPressed: (_) =>
                        Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme(),
                    children: [
                      const Icon(Icons.sunny),
                      const Icon(Icons.nightlight)
                    ]),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () async {
                    await signoutMethod();
                    Navigator.of(context).popAndPushNamed(LandingPage.route);
                  },
                  child: const Text('Signout',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ));
  }
}

Future<void> signoutMethod() async {
  try {
    await Amplify.Auth.signOut();
  } on AuthException catch (e) {
    print(e.message);
  }
}
