import 'package:flutter/material.dart';

class TalkToUsScreen extends StatefulWidget {
  static const routeName = "/talk-to-us";
  @override
  State<StatefulWidget> createState() => _TalkToUsScreenState();
}

class _TalkToUsScreenState extends State<TalkToUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("talk to us"),
      ),
    );
  }
}
