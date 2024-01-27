import 'dart:convert';

class Education {
  String? educationState;
  String? university;
  String? department;
  String? startDate;
  String? endDate;
  bool? isStudying;
  Education({
    this.educationState,
    this.university,
    this.department,
    this.startDate,
    this.endDate,
    this.isStudying,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (educationState != null) {
      result.addAll({'educationState': educationState});
    }
    if (university != null) {
      result.addAll({'university': university});
    }
    if (department != null) {
      result.addAll({'department': department});
    }
    if (startDate != null) {
      result.addAll({'startDate': startDate});
    }
    if (endDate != null) {
      result.addAll({'endDate': endDate});
    }
    if (isStudying != null) {
      result.addAll({'isStudying': isStudying});
    }

    return result;
  }

  factory Education.fromMap(Map<String, dynamic> map) {
    return Education(
      educationState: map['educationState'],
      university: map['university'],
      department: map['department'],
      startDate: map['startDate'],
      endDate: map['endDate'],
      isStudying: map['isStudying'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Education.fromJson(String source) =>
      Education.fromMap(json.decode(source));
}
