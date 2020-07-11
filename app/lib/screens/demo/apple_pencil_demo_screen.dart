import 'package:flutter/material.dart';
import 'package:robbin/utils/routes/routing.dart';

class ApplePencilDemoScreen extends StatefulWidget {
  static const routeName = RouteSpecs.DEMO_APPLE_PENCIL;

  ApplePencilDemoScreen({Key key}) : super(key: key);

  @override
  _ApplePencilDemoScreenState createState() => _ApplePencilDemoScreenState();
}

class _ApplePencilDemoScreenState extends State<ApplePencilDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("apple pencil demo"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return TextField();
  }
}
