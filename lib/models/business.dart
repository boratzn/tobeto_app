import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Business {
  String? companyName;
  String? position;
  String? sector;
  String? province;
  DateTime? startDate;
  DateTime? endDate;
  bool? isWorking;
  String? workDescription;
  Business({
    this.companyName,
    this.position,
    this.sector,
    this.province,
    this.startDate,
    this.endDate,
    this.isWorking,
    this.workDescription,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (companyName != null) {
      result.addAll({'companyName': companyName});
    }
    if (position != null) {
      result.addAll({'position': position});
    }
    if (sector != null) {
      result.addAll({'sector': sector});
    }
    if (province != null) {
      result.addAll({'province': province});
    }
    if (startDate != null) {
      result.addAll({'startDate': startDate});
    }
    if (endDate != null) {
      result.addAll({'endDate': endDate});
    }
    if (isWorking != null) {
      result.addAll({'isWorking': isWorking});
    }
    if (workDescription != null) {
      result.addAll({'workDescription': workDescription});
    }

    return result;
  }

  factory Business.fromMap(Map<String, dynamic> map) {
    return Business(
      companyName: map['companyName'],
      position: map['position'],
      sector: map['sector'],
      province: map['province'],
      startDate: map['startDate'] != null
          ? (map['startDate'] as Timestamp).toDate()
          : null,
      endDate: map['endDate'] != null
          ? (map['endDate'] as Timestamp).toDate()
          : null,
      isWorking: map['isWorking'],
      workDescription: map['workDescription'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Business.fromJson(String source) =>
      Business.fromMap(json.decode(source));
}
