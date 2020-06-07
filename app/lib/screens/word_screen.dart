import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WordScreen extends StatefulWidget {
  static const routeName = "/word/:id";

  WordScreen({Key key}) : super(key: key);

  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("woords"),
      ),
      body: buildBody(),
    );
  }

  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 24, vertical: 16);

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: buildTokenSection(),
            padding: padding,
          ),
          Container(
            child: buildDescriptionSection(),
            padding: padding,
          ),
          Container(
            child: buildExamplesSection(),
            padding: padding,
          ),
          Container(
            child: buildIllustrationSection(),
            padding: padding,
          ),
        ],
      ),
    );
  }

  Widget buildTokenSection() {
    return Row(
      children: [
        Text(
          "😅 abash",
          style: Theme.of(context).textTheme.headline2,
          maxLines: 3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
        ),
        IconButton(
            icon: Icon(Icons.record_voice_over),
            onPressed: () {
              // handle click here
            }),
      ],
    );
  }

  Widget buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: buildNativeDescriptionSection(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
        Container(
          child: buildTranslateDescriptionSection(),
        ),
      ],
    );
  }

  Widget buildNativeDescriptionSection() {
    var style = Theme.of(context).textTheme.bodyText2;
    return new RichText(
      text: new TextSpan(
          text: 'cause to be embarrassed; cause to feel ',
          style: style,
          children: [
            new TextSpan(
              text: 'self-conscious',
              style: style.copyWith(fontWeight: FontWeight.bold),
              recognizer: new TapGestureRecognizer()
                ..onTap = () => print('Tap Here onTap'),
            )
          ]),
    );
    return Text(
      "cause to be embarrassed; cause to feel self-conscious",
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Widget buildTranslateDescriptionSection() {
    return Text(
      "부끄럽게 하다",
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  Widget buildExamplesSection() {
    return Text(
      "To make your best friend feel abashed, you might tell her new boyfriend about the time she... but why would you want to embarrass her? Typically abash is used when something has a shaming effect. You might find yourself saying: “I was abashed by the magnitude of the others’ generosity so I donated twenty thousand more,” but you wouldn’t just use abash in place of embarrass. It would sound strange to warn, “Don’t do that, you’re going to abash yourself!",
      style: Theme.of(context).textTheme.bodyText2,
    );
  }

  Widget buildIllustrationSection() {
    return Text("buildIllustrationSection");
  }
}
