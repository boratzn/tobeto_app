import 'dart:convert';

class Language {
  String? language;
  String? level;
  Language({
    this.language,
    this.level,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (language != null) {
      result.addAll({'language': language});
    }
    if (level != null) {
      result.addAll({'level': level});
    }

    return result;
  }

  factory Language.fromMap(Map<String, dynamic> map) {
    return Language(
      language: map['language'],
      level: map['level'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Language.fromJson(String source) =>
      Language.fromMap(json.decode(source));
}
