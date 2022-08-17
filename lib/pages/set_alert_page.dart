import 'package:crypto_ping_v1/pages/my_alerts.dart';
import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../widgets/pigeon_menu.dart';

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
