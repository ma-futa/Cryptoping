import 'package:crypto_ping_v1/pages/my_alerts.dart';
import 'package:crypto_ping_v1/pages/profile_page.dart';
import 'package:flutter/material.dart';

class SetAlertPage extends StatelessWidget {
  static String route = "/SetAlertPageRoute";

  const SetAlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
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
                Row(
                  children: [
                    Text('Send me an  ',
                        style: TextStyle(color: theme.hintColor)),
                    DropdownButton(
                      focusColor: theme.splashColor,
                      dropdownColor: theme.backgroundColor.withOpacity(1),
                      value: 1,
                      alignment: Alignment.center,
                      items: [
                        DropdownMenuItem(
                          child: Text("First Item",
                              style: TextStyle(color: theme.hintColor)),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Second Item"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Third Item"), value: 3),
                        DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                      ],
                      onChanged: (_) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('as soon as ',
                        style: TextStyle(color: theme.hintColor)),
                    DropdownButton(
                      focusColor: theme.splashColor,
                      value: 1,
                      alignment: Alignment.center,
                      items: [
                        DropdownMenuItem(
                          child: Text("First Item",
                              style: TextStyle(color: theme.hintColor)),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Second Item"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Third Item"), value: 3),
                        DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                      ],
                      onChanged: (_) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('goes ', style: TextStyle(color: theme.hintColor)),
                    DropdownButton(
                      focusColor: theme.splashColor,
                      value: 1,
                      alignment: Alignment.center,
                      items: [
                        DropdownMenuItem(
                          child: Text("First Item",
                              style: TextStyle(color: theme.hintColor)),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Second Item"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Third Item"), value: 3),
                        DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                      ],
                      onChanged: (_) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('the price of ',
                        style: TextStyle(color: theme.hintColor)),
                    DropdownButton(
                      focusColor: theme.splashColor,
                      value: 1,
                      alignment: Alignment.center,
                      items: [
                        DropdownMenuItem(
                          child: Text("First Item",
                              style: TextStyle(color: theme.hintColor)),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Second Item"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Third Item"), value: 3),
                        DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                      ],
                      onChanged: (_) {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text('on ', style: TextStyle(color: theme.hintColor)),
                    DropdownButton(
                      focusColor: theme.splashColor,
                      value: 1,
                      alignment: Alignment.center,
                      items: [
                        DropdownMenuItem(
                          child: Text("First Item",
                              style: TextStyle(color: theme.hintColor)),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Second Item"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("Third Item"), value: 3),
                        DropdownMenuItem(child: Text("Fourth Item"), value: 4)
                      ],
                      onChanged: (_) {},
                    )
                  ],
                ),
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
    );
  }
}

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
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     repeat: ImageRepeat.repeatY,
          //     image: AssetImage('assets/background.jpg'),
          //   ),
          // ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(ProfilePage.route),
                    icon: Icon(Icons.account_circle),
                    iconSize: 45),
                // Text('Profile'),
                SizedBox(height: 20),
                if (ModalRoute.of(context)?.settings.name ==
                    "/SetAlertPageRoute")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(MyAlerts.route),
                    child: Text('My Alerts',
                        style: TextStyle(color: Colors.white)),
                  ),
                if (ModalRoute.of(context)?.settings.name == "/MyAlertsRoute")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(SetAlertPage.route),
                    child: Text('Set Alerts',
                        style: TextStyle(color: Colors.white)),
                  ),
                SizedBox(height: 20),
                ToggleButtons(
                    borderRadius: BorderRadius.circular(30),
                    selectedColor: Colors.black,
                    fillColor: theme.backgroundColor,
                    children: [Icon(Icons.sunny), Icon(Icons.nightlight)],
                    isSelected: const [true, false],
                    onPressed: (_) {}),
                SizedBox(height: 250),
              ],
            ),
          ),
        ));
  }
}

class PigeonMenu extends StatelessWidget {
  const PigeonMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => Scaffold.of(context).openDrawer(),
      child: Container(
        height: 50,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 3,
            color: theme.primaryColor,
          ),
        ),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        child: Image.asset(
          'assets/pigeon.png',
          color: theme.primaryColor,
          fit: BoxFit.fill,
          // width: 100,
        ),
      ),
    );
  }
}
