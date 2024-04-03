import 'package:tobeto_app/models/index.dart';

class UserAllInfo {
  UserModel user;
  List<Education>? education;
  List<Business>? business;
  List<Skill>? skills;
  List<Certificate>? certificates;
  List<SocialMedia>? socialMedias;
  List<Language>? languages;
  List<Exam>? exams;
  UserAllInfo({
    required this.user,
    this.education,
    this.business,
    this.skills,
    this.certificates,
    this.socialMedias,
    this.languages,
    this.exams,
  });
}
