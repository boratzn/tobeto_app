part of 'user_data_bloc.dart';

@immutable
sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataLoaded extends UserDataState {
  final UserModel? user;

  UserDataLoaded({required this.user});
}

class UserDataError extends UserDataState {}
