import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tobeto_app/models/business.dart';
import 'package:tobeto_app/models/education.dart';
import 'package:tobeto_app/models/language.dart';
import 'package:tobeto_app/models/skill.dart';
import 'package:tobeto_app/models/social_media.dart';
import 'package:tobeto_app/models/user.dart';
import 'package:tobeto_app/models/user_all_info.dart';
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
}
