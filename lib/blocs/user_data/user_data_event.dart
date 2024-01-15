part of 'user_data_bloc.dart';

@immutable
sealed class UserDataEvent {}

class FetchData extends UserDataEvent {}
