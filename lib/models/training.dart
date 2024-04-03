import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Training {
  String? name;
  String? date;
  String? imgUrl;
  int? progress;
  DateTime? startDate;
  DateTime? endDate;
  String? category;
  String? manufacturer;
  String? type;
  List<Content>? contents;

  Training({
    this.name,
    this.date,
    this.imgUrl,
    this.progress,
    this.startDate,
    this.endDate,
    this.category,
    this.manufacturer,
    this.type,
    this.contents,
  });

  Training copyWith({
    String? name,
    String? date,
    String? imgUrl,
    int? progress,
    DateTime? startDate,
    DateTime? endDate,
    String? category,
    String? manufacturer,
    String? type,
  }) {
    return Training(
      name: name ?? this.name,
      date: date ?? this.date,
      imgUrl: imgUrl ?? this.imgUrl,
      progress: progress ?? this.progress,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      category: category ?? this.category,
      manufacturer: manufacturer ?? this.manufacturer,
      type: type ?? this.type,
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
    if (progress != null) {
      result.addAll({'progress': progress});
    }
    if (startDate != null) {
      result.addAll({'startDate': startDate!.millisecondsSinceEpoch});
    }
    if (endDate != null) {
      result.addAll({'endDate': endDate!.millisecondsSinceEpoch});
    }
    if (category != null) {
      result.addAll({'category': category});
    }
    if (manufacturer != null) {
      result.addAll({'manufacturer': manufacturer});
    }
    if (type != null) {
      result.addAll({'type': type});
    }

    return result;
  }

  factory Training.fromMap(Map<String, dynamic> map) {
    return Training(
      name: map['name'],
      date: map['date'],
      imgUrl: map['imgUrl'],
      progress: map['progress']?.toInt(),
      startDate: map['startDate'] != null
          ? (map['startDate'] as Timestamp).toDate()
          : null,
      endDate: map['endDate'] != null
          ? (map['endDate'] as Timestamp).toDate()
          : null,
      category: map['category'],
      manufacturer: map['manufacturer'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Training.fromJson(String source) =>
      Training.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Training(name: $name, date: $date, imgUrl: $imgUrl, progress: $progress, startDate: $startDate, endDate: $endDate, category: $category, manufacturer: $manufacturer, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Training &&
        other.name == name &&
        other.date == date &&
        other.imgUrl == imgUrl &&
        other.progress == progress &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.category == category &&
        other.manufacturer == manufacturer &&
        other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        date.hashCode ^
        imgUrl.hashCode ^
        progress.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        category.hashCode ^
        manufacturer.hashCode ^
        type.hashCode;
  }
}

class Content {
  String? category;
  String? contentName;
  int? contentProgress;
  String? contentUrl;
  String? information;
  String? language;
  String? subtype;
  int? time;

  Content({
    this.category,
    this.contentName,
    this.contentProgress,
    this.contentUrl,
    this.information,
    this.language,
    this.subtype,
    this.time,
  });

  Content copyWith({
    String? category,
    String? contentName,
    int? contentProgress,
    String? contentUrl,
    String? information,
    String? language,
    String? subtype,
    int? time,
  }) {
    return Content(
      category: category ?? this.category,
      contentName: contentName ?? this.contentName,
      contentProgress: contentProgress ?? this.contentProgress,
      contentUrl: contentUrl ?? this.contentUrl,
      information: information ?? this.information,
      language: language ?? this.language,
      subtype: subtype ?? this.subtype,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (category != null) {
      result.addAll({'category': category});
    }
    if (contentName != null) {
      result.addAll({'contentName': contentName});
    }
    if (contentProgress != null) {
      result.addAll({'contentProgress': contentProgress});
    }
    if (contentUrl != null) {
      result.addAll({'contentUrl': contentUrl});
    }
    if (information != null) {
      result.addAll({'information': information});
    }
    if (language != null) {
      result.addAll({'language': language});
    }
    if (subtype != null) {
      result.addAll({'subtype': subtype});
    }
    if (time != null) {
      result.addAll({'time': time});
    }

    return result;
  }

  factory Content.fromMap(Map<String, dynamic> map) {
    return Content(
      category: map['category'],
      contentName: map['contentName'],
      contentProgress: map['contentProgress']?.toInt(),
      contentUrl: map['contentUrl'],
      information: map['information'],
      language: map['language'],
      subtype: map['subtype'],
      time: map['time']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Content.fromJson(String source) =>
      Content.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Content(category: $category, contentName: $contentName, contentProgress: $contentProgress, contentUrl: $contentUrl, information: $information, language: $language, subtype: $subtype, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Content &&
        other.category == category &&
        other.contentName == contentName &&
        other.contentProgress == contentProgress &&
        other.contentUrl == contentUrl &&
        other.information == information &&
        other.language == language &&
        other.subtype == subtype &&
        other.time == time;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        contentName.hashCode ^
        contentProgress.hashCode ^
        contentUrl.hashCode ^
        information.hashCode ^
        language.hashCode ^
        subtype.hashCode ^
        time.hashCode;
  }
}
