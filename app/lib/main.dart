import 'package:flutter/material.dart';
import 'package:words/screens/splash/splash_screen.dart';
import 'package:words/screens/word_screen.dart';
import 'package:words/utils/routes/routing.dart';
import 'package:words/utils/themes/theme.dart';

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
