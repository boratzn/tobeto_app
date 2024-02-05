part of 'user_data_bloc.dart';

@immutable
sealed class UserDataEvent {}

class FetchData extends UserDataEvent {}

class UploadImage extends UserDataEvent {
  final File selectedFile;

  UploadImage({required this.selectedFile});
}

class DeleteImage extends UserDataEvent {}

class DeleteUser extends UserDataEvent {}

class ResetPassword extends UserDataEvent {
  final String email;

  ResetPassword({required this.email});
}

class ChangePassword extends UserDataEvent {
  final String newPassword;
  final String oldPassword;

  ChangePassword({required this.oldPassword, required this.newPassword});
}

class UserInformationUpdate extends UserDataEvent {
  final UserModel model;
  UserInformationUpdate({
    required this.model,
  });
}

class EducationUpdate extends UserDataEvent {
  final List<Education> education;

  EducationUpdate({required this.education});
}

class BusinessUpdate extends UserDataEvent {
  final List<Business> business;

  BusinessUpdate({required this.business});
}

class SkillsUpdate extends UserDataEvent {
  final List<Skill> skills;

  SkillsUpdate({required this.skills});
}

class LanguageUpdate extends UserDataEvent {
  final List<Language> language;

  LanguageUpdate({required this.language});
}

class SocialUpdate extends UserDataEvent {
  final List<SocialMedia> socialMedia;

  SocialUpdate({required this.socialMedia});
}
