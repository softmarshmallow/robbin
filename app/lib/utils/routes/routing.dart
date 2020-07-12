import 'package:flutter/material.dart';
import 'package:robbin/screens/blogs/blog_home_screen.dart';
import 'package:robbin/screens/demo/demo.dart';
import 'package:robbin/screens/splash/splash_screen.dart';
import 'package:robbin/screens/talk_to_us/talk_to_us_screen.dart';
import 'package:robbin/screens/word_screen.dart';

class RouteSpecs {
  static const SPLASH_SCREEN = "/splash";
  static const WORD_DETAIL_SCREEN = "/word/:id";
  static const BLOGS_HOME_SCREEN = "/blogs";
  static const STT_SCREEN = "/stt";

  // region demo
  static const DEMO_HOME_SCREEN = "/demo/home";
  static const DEMO_APPLE_PENCIL = "/demo/apple-pencil";
// endregion demo
}

Map<String, WidgetBuilder> buildRoutes(BuildContext context) {
  return {
    SplashScreen.routeName: (c) => SplashScreen(),
    WordScreen.routeName: (c) => WordScreen(),
    TalkToUsScreen.routeName: (c) => TalkToUsScreen(),
    BlogHomeScreen.routeName: (c) => BlogHomeScreen(),

    // region demo
    DemoHomeScreen.routeName: (c) => DemoHomeScreen(),
    SpeechScreen.routeName: (c) => SpeechScreen(),
    ApplePencilDemoScreen.routeName: (c) => ApplePencilDemoScreen(),
    // endregion demo
  };
}
