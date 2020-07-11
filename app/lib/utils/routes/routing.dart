import 'package:flutter/material.dart';
import 'package:robbin/screens/splash/splash_screen.dart';
import 'package:robbin/screens/talk_to_us/talk_to_us_screen.dart';
import 'package:robbin/screens/word_screen.dart';

class RouteSpecs {
  static const SPLASH_SCREEN = "/splash";
  static const WORD_DETAIL_SCREEN = "/word/:id";
}

Map<String, WidgetBuilder> buildRoutes(BuildContext context) {
  return {
    SplashScreen.routeName: (c) => SplashScreen(),
    WordScreen.routeName: (c) => WordScreen(),
    TalkToUsScreen.routeName: (c) => TalkToUsScreen(),
  };
}
