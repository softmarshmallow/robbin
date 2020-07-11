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
        title: Icon(Icons.add),
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
      decoration: InputDecoration(
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
