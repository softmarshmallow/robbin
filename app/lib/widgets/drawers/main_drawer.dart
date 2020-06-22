import 'package:flutter/material.dart';
import 'package:words/screens/talk_to_us/talk_to_us_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Text(
                "DAY 1",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ListTile(
              title: Text("books"),
              onTap: () {},
            ),
            ListTile(
              title: Text("payments"),
              onTap: () {},
            ),
            ListTile(
              title: Text("goals"),
              onTap: () {},
            ),
            ListTile(
              title: Text("talk to us"),
              onTap: () {
                Navigator.of(context).pushNamed(TalkToUsScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
