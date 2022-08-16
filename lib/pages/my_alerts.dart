import 'package:crypto_ping_v1/pages/set_alert_page.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Row(
              children: [
                PigeonMenu(),
                SizedBox(width: 20),
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
                SizedBox(width: 70),
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
            SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  // color: Colors.black,
                  // image: DecorationImage(
                  //   fit: BoxFit.cover,
                  //   image: AssetImage('assets/background.jpg'),
                  // ),
                  ),
              child: TabBar(labelColor: theme.primaryColor, tabs: [
                Tab(
                  child: Text('Active'),
                ),
                Tab(
                  child: Text('History'),
                )
              ]),
            ),
            Expanded(
                child: TabBarView(children: [
              Container(
                  // color: Colors.green,
                  ),
              PageView()
            ]))
          ]),
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
