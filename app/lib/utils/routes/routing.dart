import 'package:flutter/material.dart';
import 'package:words/screens/splash/splash_screen.dart';
import 'package:words/screens/word_screen.dart';

class RouteSpecs {
  static const SPLASH_SCREEN = "/splash";
  static const WORD_DETAIL_SCREEN = "/word/:id";
}

Map<String, WidgetBuilder> buildRoutes(BuildContext context) {
  return {
    SplashScreen.routeName: (c) => SplashScreen(),
    WordScreen.routeName: (c) => WordScreen(),
  };
}
