import 'dart:convert';

class UserModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? imageUrl;
  final String? phoneNumber;
  final String? birthDate;
  final String? id;
  final String? country;
  final String? province;
  final String? distrinct;
  final String? neighborhood;
  final String? aboutMe;

  UserModel(
      this.firstName,
      this.lastName,
      this.email,
      this.imageUrl,
      this.phoneNumber,
      this.birthDate,
      this.id,
      this.country,
      this.province,
      this.distrinct,
      this.neighborhood,
      this.aboutMe);

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (firstName != null) {
      result.addAll({'firstName': firstName});
    }
    if (lastName != null) {
      result.addAll({'lastName': lastName});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (imageUrl != null) {
      result.addAll({'imageUrl': imageUrl});
    }
    if (phoneNumber != null) {
      result.addAll({'phoneNumber': phoneNumber});
    }
    if (birthDate != null) {
      result.addAll({'birthDate': birthDate});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (country != null) {
      result.addAll({'country': country});
    }
    if (province != null) {
      result.addAll({'province': province});
    }
    if (distrinct != null) {
      result.addAll({'distrinct': distrinct});
    }
    if (neighborhood != null) {
      result.addAll({'neighborhood': neighborhood});
    }
    if (aboutMe != null) {
      result.addAll({'aboutMe': aboutMe});
    }

    return result;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['firstName'],
      map['lastName'],
      map['email'],
      map['imageUrl'],
      map['phoneNumber'],
      map['birthDate'],
      map['id'],
      map['country'],
      map['province'],
      map['distrinct'],
      map['neighborhood'],
      map['aboutMe'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
