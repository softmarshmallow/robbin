import 'package:flutter/material.dart';
import 'package:robbin/utils/routes/routing.dart';

class DemoHomeScreen extends StatefulWidget {
  static const routeName = RouteSpecs.DEMO_HOME_SCREEN;

  DemoHomeScreen({Key key}) : super(key: key);

  @override
  _DemoHomeScreenState createState() => _DemoHomeScreenState();
}

class _DemoHomeScreenState extends State<DemoHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo home"),
      ),
      body: buildBody(),
    );
  }

  List<DemoData> demos = [
    DemoData(name: "speech to text", route: RouteSpecs.DEMO_STT_SCREEN),
    DemoData(name: "apple pencil", route: RouteSpecs.DEMO_APPLE_PENCIL),
  ];

  Widget buildBody() {
    return SingleChildScrollView(
      child: ListView.builder(
        itemBuilder: (c, i) {
          var demo = demos[i];
          return ListTile(
            title: Text(demo.name),
            onTap: () {
              Navigator.of(context).pushNamed(demo.route);
            },
          );
        },
        itemCount: demos.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class DemoData {
  const DemoData({@required this.name, @required this.route});

  final String name;
  final String route;
}
