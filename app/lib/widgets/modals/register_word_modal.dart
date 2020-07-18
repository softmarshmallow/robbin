import 'package:flutter/material.dart';
import 'package:robbin/screens/word_screen.dart';

enum RegisterWordModalStateType { SEARCHING, SEARCH_RESULT, RESTING }

class RegisterWordModal extends StatefulWidget {
  RegisterWordModal({Key key}) : super(key: key);

  @override
  _RegisterWordModalState createState() => _RegisterWordModalState();
}

class _RegisterWordModalState extends State<RegisterWordModal> {
  RegisterWordModalStateType status = RegisterWordModalStateType.SEARCHING;
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    startSearch();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      startSearch();
    } else {
      setState(() {
        status = RegisterWordModalStateType.SEARCH_RESULT;
      });
    }
  }

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
    Widget child;
    switch (this.status) {
      case RegisterWordModalStateType.SEARCHING:
        child = buildSearchingStateBody();
        break;
      case RegisterWordModalStateType.SEARCH_RESULT:
        child = buildSearchResultStateBody();
        break;
      case RegisterWordModalStateType.RESTING:
        child = buildRestingStateBody();
        break;
    }
    return SingleChildScrollView(child: child);
  }

  Widget buildInputSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        style: Theme.of(context).textTheme.headline2,
        cursorColor: Theme.of(context).cursorColor,
        focusNode: _focus,
        decoration: InputDecoration(
          hintText: "type a word",
          focusColor: Colors.transparent,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildSearchingStateBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildInputSection(),
        Container(
          padding: EdgeInsets.all(16),
          child: Text("no matching results found"),
        ),
      ],
    );
  }

  Widget buildSearchResultStateBody() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.center,
        children: [
          Text(
            "res",
            style: Theme.of(context).textTheme.headline2,
          ),
          IconButton(icon: Icon(Icons.add), onPressed: addToList),
        ],
      ),
    );
  }

  Widget buildRestingStateBody() {
    return Column(
      children: [buildInputSection(), buildRegisteredList()],
    );
  }

  List<String> list = ["t1", "t2", "t3"];

  Widget buildRegisteredList() {
    return ListView.builder(
      itemBuilder: (c, i) {
        var data = list[i];
        return ListTile(
          title: Text(data),
          onTap: () {
            moveToDetail(data);
          },
        );
      },
      itemCount: list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  // region actions

  addToList() {
    setState(() {
      status = RegisterWordModalStateType.RESTING;
    });
  }

  moveToDetail(String token) {
    Navigator.of(context).pushNamed(WordScreen.routeName);
  }

  startSearch() {
    _focus.requestFocus();
    setState(() {
      status = RegisterWordModalStateType.SEARCHING;
    });
  }

// endregion

}
