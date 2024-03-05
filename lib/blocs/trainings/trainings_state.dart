part of 'trainings_bloc.dart';

abstract class TrainingsState {}

final class TrainingsInitial extends TrainingsState {}

class TrainingsLoading extends TrainingsState {}

class TrainingsLoaded extends TrainingsState {
  final List<Training>? trainings;

  TrainingsLoaded({required this.trainings});
}
