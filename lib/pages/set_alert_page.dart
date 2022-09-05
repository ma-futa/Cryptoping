import 'dart:typed_data';

import 'package:amplify_flutter/amplify_flutter.dart';

import '../providers/user_provider.dart';
import 'my_alerts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/alert_provider.dart';
import '../widgets/main_drawer.dart';
import '../widgets/pigeon_menu.dart';
import 'package:crypto_ping_v1/models/ModelProvider.dart';

class SetAlertPage extends StatelessWidget {
  static String route = "/SetAlertPageRoute";

  const SetAlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider<AlertProvider>.value(
      value: AlertProvider(),
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                const PigeonMenu(),
                const SizedBox(width: 20),
                Text(
                  'Price Alert',
                  style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(width: 70),
                Expanded(
                  child: Text(
                    'Get notified when a coin goes above or below a price target.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 70),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  NotificationMethodWidget(),
                  CurrencyWidget(),
                  IsAboveWidget(),
                  const PriceWidget(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('current price standing at \$37 an Eth'),
                  ),
                  CryptoPlatformWidget(),
                ]),
              ],
            ),
            const SizedBox(height: 40),
            Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () async {
                  final prov =
                      Provider.of<AlertProvider>(context, listen: false);
                  final user =
                      Provider.of<UserProvider>(context, listen: false);
                  await Amplify.DataStore.save(Alert(
                    notificationMethod: prov.getNotificationMethod,
                    notificationMethodValue:
                        prov.getNotificationMethod == 'Email'
                            ? user.getEmail
                            : user.getNumber,
                    owner: user.getName,
                    currency: prov.getCurrency,
                    aboveOrBelow: prov.getIsAboveNotBelow,
                    isActive: 'true',
                    price: prov.getPrice.toString(),
                    platform: prov.getCryptoPlatform,
                    created: DateTime.now().toIso8601String(),
                  ));
                  print('xxxxxxxxxxxxxxxxxxxxxxx');
                  // await readFromDatabase();
                  // await onTestApi();
                  // await savePost();
                  // await readFromDatabase();
                  Navigator.of(context).pushNamed(MyAlerts.route);
                },
                style: ElevatedButton.styleFrom(primary: theme.primaryColor),
                child: const Text("Set Alert"),
              );
            }),
          ]),
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final prov = Provider.of<AlertProvider>(context);
    return Row(children: [
      Text('the price of \$', style: TextStyle(color: theme.hintColor)),
      SizedBox(
        width: 70,
        child: TextField(
          // expands: false,
          onChanged: ((value) => prov.setPrice(double.parse(value))),
          keyboardType: TextInputType.number,
        ),
      )
    ]);
  }
}

class NotificationMethodWidget extends StatelessWidget {
  NotificationMethodWidget({
    Key? key,
  }) : super(key: key);

  final list = ['SMS', 'Email'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text('Send me an ', style: TextStyle(color: theme.hintColor)),
        DropdownButton<String>(
          focusColor: theme.splashColor,
          value: Provider.of<AlertProvider>(context).getNotificationMethod,
          alignment: Alignment.center,
          items: list
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (val) {
            Provider.of<AlertProvider>(context, listen: false)
                .setNotificationMethod(val!);
            print('xes');
          },
        )
      ],
    );
  }
}

class CurrencyWidget extends StatelessWidget {
  CurrencyWidget({
    Key? key,
  }) : super(key: key);

  final list = ['BTC', 'ETH'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text('as soon as ', style: TextStyle(color: theme.hintColor)),
        DropdownButton<String>(
          focusColor: theme.splashColor,
          value: Provider.of<AlertProvider>(context).getCurrency,
          alignment: Alignment.center,
          items: list
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (val) {
            Provider.of<AlertProvider>(context, listen: false)
                .setCurrency(val!);
            print('xes');
          },
        )
      ],
    );
  }
}

class IsAboveWidget extends StatelessWidget {
  IsAboveWidget({
    Key? key,
  }) : super(key: key);

  final list = ['above', 'below'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text('goes ', style: TextStyle(color: theme.hintColor)),
        DropdownButton<String>(
          focusColor: theme.splashColor,
          value: Provider.of<AlertProvider>(context).getIsAboveNotBelow,
          alignment: Alignment.center,
          items: list
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (val) {
            Provider.of<AlertProvider>(context, listen: false).setIsAbove(val!);
            print('xes');
          },
        )
      ],
    );
  }
}

class CryptoPlatformWidget extends StatelessWidget {
  CryptoPlatformWidget({
    Key? key,
  }) : super(key: key);

  final list = ['CoinBase', 'Binance', 'Cryptomaster'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text('on ', style: TextStyle(color: theme.hintColor)),
        DropdownButton<String>(
          focusColor: theme.splashColor,
          value: Provider.of<AlertProvider>(context).getCryptoPlatform,
          alignment: Alignment.center,
          items: list
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (val) {
            Provider.of<AlertProvider>(context, listen: false)
                .setCrptoPlatform(val!);
            print('xes');
          },
        )
      ],
    );
  }
}

Future<void> onTestApi() async {
  try {
    final options = RestOptions(
        path: '/createAlert',
        body: Uint8List.fromList('{\'name\':\'Mow the lawn\'}'.codeUnits));
    final restOperation = Amplify.API.post(restOptions: options);
    final response = await restOperation.response;
    print(
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
    print('POST call succeeded');
    print(String.fromCharCodes(response.data));
  } on ApiException catch (e) {
    print('POST call failed: $e');
  }
}

Future<void> getTodo() async {
  try {
    const options = RestOptions(path: '/books');
    final restOperation = Amplify.API.get(restOptions: options);
    final response = await restOperation.response;
    print('GET call succeeded: ${response.data}');
  } on ApiException catch (e) {
    print('GET call failed: $e');
  }
}

Future<void> saveAlertToLocalDataStore(Alert alert) async {
  await Amplify.DataStore.save(alert);
  print('successful');
}
