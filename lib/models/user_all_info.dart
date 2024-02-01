import 'package:tobeto_app/models/business.dart';
import 'package:tobeto_app/models/certificate.dart';
import 'package:tobeto_app/models/education.dart';
import 'package:tobeto_app/models/language.dart';
import 'package:tobeto_app/models/skill.dart';
import 'package:tobeto_app/models/social_media.dart';
import 'package:tobeto_app/models/training.dart';
import 'package:tobeto_app/models/user.dart';

class UserAllInfo {
  UserModel user;
  Education? education;
  Business? business;
  List<Skill>? skills;
  List<Certificate>? certificates;
  List<SocialMedia>? socialMedias;
  List<Language>? languages;
  List<Training>? trainings;
  UserAllInfo(
      {required this.user,
      this.education,
      this.business,
      this.skills,
      this.certificates,
      this.socialMedias,
      this.languages,
      this.trainings});
}
