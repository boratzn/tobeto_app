import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/user_auth/firebase_auth_services.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final FirebaseAuthService _authService;
  UserDataBloc(this._authService) : super(UserDataInitial()) {
    on<FetchData>(_fetchData);
    on<UploadImage>(_uploadImage);
    on<UserInformationUpdate>(_userInfoUpdate);
    on<BusinessUpdate>(_businessInfoUpdate);
    on<DeleteImage>(_deleteImage);
    on<EducationUpdate>(_educationInfoUpdate);
    on<SkillsUpdate>(_skillsInfoUpdate);
    on<SocialUpdate>(_socialMediaInfoUpdate);
    on<LanguageUpdate>(_languageInfoUpdate);
    on<DeleteUser>(_deleteUser);
    on<ChangePassword>(_changePassword);
    on<ResetPassword>(_resetPassword);
    on<UploadCertificate>(_uploadCertificate);
    on<DownloadCertificate>(_downloadCertificate);
    on<DeleteBusinessInfoById>(_deleteBusinessInfoById);
    on<DeleteEducationInfoById>(_deleteEducationInfoById);
    on<DeleteSkillInfoById>(_deleteSkillInfoById);
    on<DeleteSocialMediaInfoById>(_deleteSocialMediaInfoById);
    on<DeleteLanguageInfoById>(_deleteLanguageInfoById);
    on<UpdateSocialMediaInfoById>(_updateSocialMediaInfoById);
  }

  _fetchData(FetchData event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _uploadImage(UploadImage event, Emitter<UserDataState> emit) async {
    try {
      await _authService.upload(event.selectedFile);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _deleteImage(DeleteImage event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      _authService.delete();
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _userInfoUpdate(
      UserInformationUpdate event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      _authService.updateUserInformation(event.model);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _businessInfoUpdate(BusinessUpdate event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      _authService.updateBusinessInformation(event.business);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _educationInfoUpdate(
      EducationUpdate event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      _authService.updateEducationInformation(event.education);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _skillsInfoUpdate(SkillsUpdate event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      _authService.updateSkillsInformation(event.skills);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _socialMediaInfoUpdate(
      SocialUpdate event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      _authService.updateSocialMediaInformation(event.socialMedia);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _languageInfoUpdate(LanguageUpdate event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      _authService.updateLanguagesInformation(event.language);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _deleteUser(DeleteUser event, Emitter<UserDataState> emit) async {
    try {
      _authService.deleteUserAndDocument();
    } catch (e) {
      emit(UserDataError());
    }
  }

  _changePassword(ChangePassword event, Emitter<UserDataState> emit) async {
    try {
      _authService.changePassword(event.newPassword, event.oldPassword);
    } catch (e) {
      emit(UserDataError());
    }
  }

  _resetPassword(ResetPassword event, Emitter<UserDataState> emit) async {
    try {
      _authService.resetPassword(event.email);
    } catch (e) {
      emit(UserDataError());
    }
  }

  _uploadCertificate(
      UploadCertificate event, Emitter<UserDataState> emit) async {
    try {
      _authService.uploadCertificate(event.file);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _downloadCertificate(
      DownloadCertificate event, Emitter<UserDataState> emit) async {
    try {
      _authService.downloadPDF(event.certificate);
    } catch (e) {
      emit(UserDataError());
    }
  }

  _deleteBusinessInfoById(
      DeleteBusinessInfoById event, Emitter<UserDataState> emit) async {
    try {
      await _authService.deleteBusinessInfoByIndex(event.index);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _deleteEducationInfoById(
      DeleteEducationInfoById event, Emitter<UserDataState> emit) async {
    try {
      await _authService.deleteEducationInfoById(event.index);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _deleteSkillInfoById(
      DeleteSkillInfoById event, Emitter<UserDataState> emit) async {
    try {
      await _authService.deleteSkillInfoById(event.index);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _deleteSocialMediaInfoById(
      DeleteSocialMediaInfoById event, Emitter<UserDataState> emit) async {
    try {
      await _authService.deleteSocialMediaInfoById(event.index);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _deleteLanguageInfoById(
      DeleteLanguageInfoById event, Emitter<UserDataState> emit) async {
    try {
      await _authService.deleteLanguageInfoById(event.index);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }

  _updateSocialMediaInfoById(
      UpdateSocialMediaInfoById event, Emitter<UserDataState> emit) async {
    try {
      await _authService.updateSocialMediaInfoById(event.index, event.sm);
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(userInfo: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }
}
