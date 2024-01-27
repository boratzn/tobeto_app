import 'dart:convert';

class SocialMedia {
  String? name;
  String? url;
  SocialMedia({
    this.name,
    this.url,
  });

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

  factory SocialMedia.fromMap(Map<String, dynamic> map) {
    return SocialMedia(
      name: map['name'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMedia.fromJson(String source) =>
      SocialMedia.fromMap(json.decode(source));
}
