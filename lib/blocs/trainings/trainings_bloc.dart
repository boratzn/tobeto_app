import 'package:bloc/bloc.dart';
import 'package:tobeto_app/models/index.dart';

part 'trainings_event.dart';
part 'trainings_state.dart';

class TrainingsBloc extends Bloc<TrainingsEvent, TrainingsState> {
  TrainingsBloc() : super(TrainingsInitial()) {
    on<TrainingsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
