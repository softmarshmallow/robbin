import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:robbin/data/models/word.dart';

class WordRepository {
  List<Word> _words;
  Future<List<Word>> loadAll(BuildContext context) async {
    if (_words != null) {
      return _words;
    }
    List<Word> fetchedWords = [];
    String data = await DefaultAssetBundle.of(context)
        .loadString("dictionary/word-smart.json");
    final jsonResult = json.decode(data);

    for (var wordJson in jsonResult) {
      var word = Word.fromJson(wordJson);
      fetchedWords.add(word);
    }
    _words = fetchedWords;
    return _words;
  }
}
