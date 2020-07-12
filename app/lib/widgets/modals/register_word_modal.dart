import 'package:flutter/material.dart';

class RegisterWordModal extends StatefulWidget {
  RegisterWordModal({Key key}) : super(key: key);

  @override
  _RegisterWordModalState createState() => _RegisterWordModalState();
}

class _RegisterWordModalState extends State<RegisterWordModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: buildInputSection(),
          )
        ],
      ),
    );
  }

  Widget buildInputSection() {
    return TextField(
      style: Theme.of(context).textTheme.headline2,
      cursorColor: Theme.of(context).cursorColor,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "type a word",
        focusColor: Colors.transparent,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
