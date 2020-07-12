import 'package:flutter/material.dart';
import 'package:robbin/utils/routes/routing.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechScreen extends StatefulWidget {
  static const routeName = RouteSpecs.STT_SCREEN;

  SpeechScreen({Key key}) : super(key: key);

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: buildBody(),
      ),
    );
  }

  String result = "listening..";
  bool listening = false;

  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          result,
          style: Theme.of(context).textTheme.headline1,
        ),
        if (!listening)
          IconButton(icon: Icon(Icons.mic), onPressed: startSpeech),
        if (listening)
          IconButton(icon: Icon(Icons.stop), onPressed: stopSpeech),
      ],
    );
  }

  stt.SpeechToText speech;

  stopSpeech() {
    if (speech.isAvailable) {
      speech.stop();
    }
    setState(() {
      listening = false;
    });
  }

  startSpeech() async {
    speech = stt.SpeechToText();
    bool available = await speech.initialize(onStatus: (s) {
      print(s);
      if (s == "notListening") {
        setState(() {
          listening = false;
        });
      } else if (s == "listening") {
        setState(() {
          listening = true;
        });
      }
    }, onError: (e) {
      print(e);
    });
    if (available) {
      setState(() {
        listening = true;
      });
      speech.listen(
          listenFor: Duration(seconds: 5),
          pauseFor: Duration(seconds: 2),
          localeId: "en",
          onResult: (r) {
            if (r.finalResult) {
              stopSpeech();
              setState(() {
                result = r.recognizedWords;
              });
            } else {
              var text = "";
              r.alternates.forEach((element) {
                text += "${element.recognizedWords}";
              });
              setState(() {
                result = text;
              });
              print("result : ${r}");
            }
          });
    } else {
      print("The user has denied the use of speech recognition.");
    }
    // some time later...
//    speech.stop();
  }
}
