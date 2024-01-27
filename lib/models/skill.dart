import 'dart:convert';

class Skill {
  String? skillName;
  Skill({
    this.skillName,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (skillName != null) {
      result.addAll({'skillName': skillName});
    }

    return result;
  }

  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      skillName: map['skillName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Skill.fromJson(String source) => Skill.fromMap(json.decode(source));
}
