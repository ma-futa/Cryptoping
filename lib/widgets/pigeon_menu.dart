import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
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
