import 'package:flutter/material.dart';
import 'package:robbin/utils/routes/routing.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SttDemoScreen extends StatefulWidget {
  static const routeName = RouteSpecs.DEMO_STT_SCREEN;

  SttDemoScreen({Key key}) : super(key: key);

  @override
  _SttDemoScreenState createState() => _SttDemoScreenState();
}

class _SttDemoScreenState extends State<SttDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("speech to text"),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return RaisedButton(
      onPressed: speech,
      child: Text("start speech"),
    );
  }

  speech() async {
    stt.SpeechToText speech = stt.SpeechToText();
    bool available = await speech.initialize(onStatus: (s) {
      print(s);
    }, onError: (e) {
      print(e);
    });
    if (available) {
      speech.listen(onResult: (r) {
        print("result : ${r}");
      });
    } else {
      print("The user has denied the use of speech recognition.");
    }
    // some time later...
//    speech.stop();
  }
}
