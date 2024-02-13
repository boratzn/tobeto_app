import 'dart:convert';

class Exam {
  String? title;
  String? subtitle;
  String? time;
  bool? isDone;

  Exam({
    this.title,
    this.subtitle,
    this.time,
    this.isDone,
  });

  Exam copyWith({
    String? title,
    String? subtitle,
    String? time,
    bool? isDone,
  }) {
    return Exam(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      time: time ?? this.time,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (title != null) {
      result.addAll({'title': title});
    }
    if (subtitle != null) {
      result.addAll({'subtitle': subtitle});
    }
    if (time != null) {
      result.addAll({'time': time});
    }
    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }

    return result;
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      title: map['title'],
      subtitle: map['subtitle'],
      time: map['time'],
      isDone: map['isDone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Exam.fromJson(String source) => Exam.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Exam(title: $title, subtitle: $subtitle, time: $time, isDone: $isDone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Exam &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.time == time &&
        other.isDone == isDone;
  }

  @override
  int get hashCode {
    return title.hashCode ^ subtitle.hashCode ^ time.hashCode ^ isDone.hashCode;
  }
}
