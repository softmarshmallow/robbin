import 'package:flutter/material.dart';
import 'package:robbin/screens/splash/splash_screen.dart';
import 'package:robbin/screens/word_screen.dart';
import 'package:robbin/utils/routes/routing.dart';
import 'package:robbin/utils/themes/theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ROBBIN',
      routes: buildRoutes(context),
      theme: buildTheme(context),
      initialRoute: SplashScreen.routeName,
    );
  }
}
