import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:crypto_ping_v1/pages/set_alert_page.dart';
import 'package:flutter/material.dart';

import '../models/Alert.dart';
import '../widgets/main_drawer.dart';
import '../widgets/pigeon_menu.dart';

class MyAlerts extends StatelessWidget {
  static String route = "/MyAlertsRoute";

  const MyAlerts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                const PigeonMenu(),
                const SizedBox(width: 20),
                Text(
                  'My Alerts',
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
                    'View and manage all your crypto alerts in one place.',
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
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  // color: Colors.black,
                  // image: DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: AssetImage('assets/background.jpg'),
                  // ),
                  ),
              child: TabBar(labelColor: theme.primaryColor, tabs: const [
                Tab(
                  child: Text('Active'),
                ),
                Tab(
                  child: Text('History'),
                )
              ]),
            ),
            FutureBuilder<List<Alert>>(
                future: readFromDatabase(),
                builder: (context, snapshot) {
                  if (snapshot.data == null || snapshot.data!.length == 0) {
                    return const Center(
                      child: Text('Please create new Alerts👍'),
                    );
                  } else {
                    print('xxxxxxxxxxxxxxxxx');
                    print(snapshot.data);
                    final activeAlerts = snapshot.data!
                        .where((element) => element.isActive == 'true')
                        .toList();
                    final historicAlerts = snapshot.data!
                        .where((element) => element.isActive != 'true')
                        .toList();
                    return Expanded(
                      child: TabBarView(children: [
                        Column(
                            children: activeAlerts
                                .map((e) => AlertItemWidget(alert: e))
                                .toList()),
                        Column(
                          children: [
                            Card(
                                color: theme.primaryColor.withOpacity(0.5),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: theme.backgroundColor,
                                    child: const Center(
                                        child: Text('BTC',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))),
                                  ),
                                  title: const Text(
                                    "set an hour ago",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: const Text(
                                    "BTC went below 400 on CoinBase. Alert via SMS",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )),
                          ],
                        ),
                      ]),
                    );
                  }
                })
          ]),
        ),
      ),
      drawer: const MainDrawer(),
    );
  }
}

class AlertItemWidget extends StatelessWidget {
  const AlertItemWidget({
    required this.alert,
    Key? key,
  }) : super(key: key);
  final Alert alert;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
        color: theme.primaryColor,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: theme.backgroundColor,
            child: Center(
                child: Text(alert.currency,
                    style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          title: Text(
            "set an hour ago ${DateTime.parse(alert.created)}",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "${alert.currency} went ${alert.aboveOrBelow} ${alert.price} on ${alert.platform}. Alert via ${alert.notificationMethod}",
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}

Future<List<Alert>> readFromDatabase() async {
  List<Alert> alerts = [];
  try {
    alerts = await Amplify.DataStore.query(Alert.classType);
    print('dddddddddddddddddddddddddddddddddd');
    print('alerts: $alerts');
  } on DataStoreException catch (e) {
    print('Query failed: $e');
  } finally {
    return alerts;
  }
}
