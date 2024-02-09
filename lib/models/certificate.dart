import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Certificate {
  final String? name;
  final String? url;
  final DateTime? createdDate;

  Certificate(
    this.name,
    this.url,
    this.createdDate,
  );

  Certificate copyWith({
    String? name,
    String? url,
    DateTime? createdDate,
  }) {
    return Certificate(
      name ?? this.name,
      url ?? this.url,
      createdDate ?? this.createdDate,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (name != null) {
      result.addAll({'name': name});
    }
    if (url != null) {
      result.addAll({'url': url});
    }
    if (createdDate != null) {
      result.addAll({'createdDate': createdDate!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory Certificate.fromMap(Map<String, dynamic> map) {
    return Certificate(
      map['name'],
      map['url'],
      map['createdDate'] != null
          ? (map['createdDate'] as Timestamp).toDate()
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Certificate.fromJson(String source) =>
      Certificate.fromMap(json.decode(source));

  @override
  String toString() =>
      'Certificate(name: $name, url: $url, createdDate: $createdDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Certificate &&
        other.name == name &&
        other.url == url &&
        other.createdDate == createdDate;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode ^ createdDate.hashCode;
}
