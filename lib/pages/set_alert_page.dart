import 'package:crypto_ping_v1/pages/my_alerts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/alert_provider.dart';
import '../widgets/main_drawer.dart';
import '../widgets/pigeon_menu.dart';

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
                PigeonMenu(),
                SizedBox(width: 20),
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
                SizedBox(width: 70),
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
            SizedBox(height: 40),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 70),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  NotificationMethodWidget(),
                  CurrencyWidget(),
                  IsAboveWidget(),
                  Row(children: [
                    Text('the price of \$',
                        style: TextStyle(color: theme.hintColor)),
                    SizedBox(
                      width: 70,
                      child: TextField(
                        // expands: false,
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ]),
                  CryptoPlatformWidget(),
                ]),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed(MyAlerts.route),
              child: Text("Set Alert"),
              style: ElevatedButton.styleFrom(primary: theme.primaryColor),
            ),
          ]),
        ),
        drawer: MainDrawer(),
      ),
    );
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
        DropdownButton<int>(
          focusColor: theme.splashColor,
          value: Provider.of<AlertProvider>(context).getNotificationMethod,
          alignment: Alignment.center,
          items: list
              .map((item) => DropdownMenuItem(
                    child: Text(item),
                    value: list.indexOf(item),
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
        DropdownButton<int>(
          focusColor: theme.splashColor,
          value: Provider.of<AlertProvider>(context).getCurrency,
          alignment: Alignment.center,
          items: list
              .map((item) => DropdownMenuItem(
                    child: Text(item),
                    value: list.indexOf(item),
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
        DropdownButton<int>(
          focusColor: theme.splashColor,
          value: Provider.of<AlertProvider>(context).getIsAbove,
          alignment: Alignment.center,
          items: list
              .map((item) => DropdownMenuItem(
                    child: Text(item),
                    value: list.indexOf(item),
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
        DropdownButton<int>(
          focusColor: theme.splashColor,
          value: Provider.of<AlertProvider>(context).getCryptoPlatform,
          alignment: Alignment.center,
          items: list
              .map((item) => DropdownMenuItem(
                    child: Text(item),
                    value: list.indexOf(item),
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
