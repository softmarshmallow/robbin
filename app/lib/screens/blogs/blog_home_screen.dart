import 'package:flutter/material.dart';
import 'package:robbin/data/local/constants/service_constants.dart';
import 'package:robbin/utils/routes/routing.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogHomeScreen extends StatefulWidget {
  static const routeName = RouteSpecs.BLOGS_HOME_SCREEN;

  BlogHomeScreen({Key key}) : super(key: key);

  @override
  _BlogHomeScreenState createState() => _BlogHomeScreenState();
}

class _BlogHomeScreenState extends State<BlogHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: ROBBIN_WEB_HOST,
    );
  }
}
