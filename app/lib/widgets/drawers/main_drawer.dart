import 'package:flutter/material.dart';
import 'package:robbin/screens/blogs/blog_home_screen.dart';
import 'package:robbin/screens/demo/demo_home_screen.dart';
import 'package:robbin/screens/talk_to_us/talk_to_us_screen.dart';

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
            ListTile(
              title: Text("blog"),
              onTap: () {
                Navigator.of(context).pushNamed(BlogHomeScreen.routeName);
              },
            ),
            ListTile(
              title: Text("developer"),
              onTap: () {
                Navigator.of(context).pushNamed(DemoHomeScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
