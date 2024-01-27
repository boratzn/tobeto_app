import 'dart:convert';

class Certificate {
  final String? name;
  final String? url;

  Certificate(this.name, this.url);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (url != null) {
      result.addAll({'url': url});
    }

    return result;
  }

  factory Certificate.fromMap(Map<String, dynamic> map) {
    return Certificate(
      map['name'],
      map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Certificate.fromJson(String source) =>
      Certificate.fromMap(json.decode(source));
}
