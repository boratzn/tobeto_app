import 'package:bloc/bloc.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/user_auth/firebase_auth_services.dart';

part 'trainings_event.dart';
part 'trainings_state.dart';

class TrainingsBloc extends Bloc<TrainingsEvent, TrainingsState> {
  final FirebaseAuthService _authService;
  TrainingsBloc(this._authService) : super(TrainingsLoading()) {
    on<GetTrainings>(_getTrainings);
  }

  _getTrainings(GetTrainings event, Emitter<TrainingsState> emit) async {
    emit(TrainingsLoading());
    try {
      final trainings = await _authService
          .getTrainingsByUid(_authService.auth.currentUser!.uid);
      emit(TrainingsLoaded(trainings: trainings));
    } catch (e) {
      emit(TrainingsError());
    }
  }
}
