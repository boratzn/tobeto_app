import 'dart:convert';

class Training {
  String? name;
  String? date;
  String? imgUrl;
  Training({
    this.name,
    this.date,
    this.imgUrl,
  });

  Training copyWith({
    String? name,
    String? date,
    String? imgUrl,
  }) {
    return Training(
      name: name ?? this.name,
      date: date ?? this.date,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (date != null) {
      result.addAll({'date': date});
    }
    if (imgUrl != null) {
      result.addAll({'imgUrl': imgUrl});
    }

    return result;
  }

  factory Training.fromMap(Map<String, dynamic> map) {
    return Training(
      name: map['name'],
      date: map['date'],
      imgUrl: map['imgUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Training.fromJson(String source) =>
      Training.fromMap(json.decode(source));

  @override
  String toString() => 'Training(name: $name, date: $date, imgUrl: $imgUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Training &&
        other.name == name &&
        other.date == date &&
        other.imgUrl == imgUrl;
  }

  @override
  int get hashCode => name.hashCode ^ date.hashCode ^ imgUrl.hashCode;
}
