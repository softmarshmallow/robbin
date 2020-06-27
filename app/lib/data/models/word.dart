import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  Word({this.token, this.examples});

  String token;
  String definition;
  List<WordExample> examples;

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);
}

@JsonSerializable()
class WordMeta {
  WordMeta({this.token, this.definitions});

  String token;
  List<Word> definitions;

  factory WordMeta.fromJson(Map<String, dynamic> json) =>
      _$WordMetaFromJson(json);

  Map<String, dynamic> toJson() => _$WordMetaToJson(this);
}

@JsonSerializable()
class WordExample {
  WordExample({this.content});

  String content;

  factory WordExample.fromJson(Map<String, dynamic> json) =>
      _$WordExampleFromJson(json);

  Map<String, dynamic> toJson() => _$WordExampleToJson(this);
}

@JsonSerializable()
class Dictionary {
  Dictionary({this.type, this.words});

  DictionaryType type;
  List<Word> words; // todo wrap with dictionary meta container

  factory Dictionary.fromJson(Map<String, dynamic> json) =>
      _$DictionaryFromJson(json);

  Map<String, dynamic> toJson() => _$DictionaryToJson(this);
}

enum DictionaryType { BOOK, LIST }
