import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:robbin/data/models/word.dart';
import 'package:robbin/data/repository/word_repository.dart';
import 'package:robbin/utils/external_definitions/external_definitions.dart';
import 'package:robbin/utils/routes/routing.dart';
import 'package:robbin/utils/url_launch/url_launch.dart';
import 'package:robbin/widgets/drawers/main_drawer.dart';
import 'package:robbin/widgets/modals/register_word_modal.dart';

class WordScreen extends StatefulWidget {
  static const routeName = RouteSpecs.WORD_DETAIL_SCREEN;
  final int index;

  WordScreen({Key key, this.index = 0}) : super(key: key);

  @override
  _WordScreenState createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  Word word;

  Future<Word> fetchData() async {
    word = (await WordRepository().loadAll(context))[widget.index];
    return word;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: showRegisterWordModal)
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder<Word>(
            builder: (c, s) {
              if (s.hasData) {
                return buildContentBody();
              } else {
                return SizedBox.shrink();
              }
            },
            future: fetchData(),
          ),
          buildActionSection(),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  showRegisterWordModal() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (c) => RegisterWordModal(), fullscreenDialog: true),
    );
  }

  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 24, vertical: 16);

  Widget buildContentBody() {
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
          Container(
            child: buildExternalDefinitions(),
            padding: padding,
          )
        ],
      ),
    );
  }

  Widget buildTokenSection() {
    return Wrap(
      children: [
        Text(
          "😅 ${word.token}",
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
//        Container(
//          child: buildTranslateDescriptionSection(),
//        ),
      ],
    );
  }

  Widget buildNativeDescriptionSection() {
    var style = Theme.of(context).textTheme.bodyText2;
    return new RichText(
      text: TextSpan(
        text: word.definition,
        style: style,
      ),
//      text: new TextSpan(
//          text: 'cause to be embarrassed; cause to feel ',
//          style: style,
//          children: [
//            new TextSpan(
//              text: 'self-conscious',
//              style: style.copyWith(fontWeight: FontWeight.bold),
//              recognizer: new TapGestureRecognizer()
//                ..onTap = () => print('Tap Here onTap'),
//            )
//          ]),
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
//    return Text("buildIllustrationSection");
    return SizedBox.shrink();
  }

  Widget buildExternalDefinitions() {
    return Column(
      children: [
        FlatButton(
            onPressed: () {
              openUrl(
                  ExternalDefinitionUtils.buildOxfordDefinition(word.token));
            },
            child: Text("view on oxford")),
      ],
    );
  }

  Widget buildActionSection() {
    return Positioned(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.help),
                  onPressed: () {
                    showHint();
                  }),
              SizedBox(
                width: 36,
              ),
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    markAsKnown();
                  }),
            ],
          ),
          FlatButton(
              onPressed: () {
                skip();
              },
              child: Text("skip"))
        ],
      ),
      bottom: 24,
      left: 0,
      right: 0,
    );
  }

  // region actions
  markAsKnown() {
    loadNext();
  }

  showHint() {
    // todo -> show hint in images, then in 초성 then in, native language
  }

  skip() {
    loadNext();
  }

  loadNext() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (c) => WordScreen(
              index: widget.index + 1,
            )));
  }
// endregion actions

}
