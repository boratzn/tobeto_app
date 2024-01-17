import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tobeto_app/models/user.dart';
import 'package:tobeto_app/user_auth/firebase_auth_services.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final FirebaseAuthService _authService;
  UserDataBloc(this._authService) : super(UserDataInitial()) {
    on<FetchData>(_fetchData);
  }

  _fetchData(FetchData event, Emitter<UserDataState> emit) async {
    emit(UserDataLoading());
    try {
      final userData = await _authService.getUserData();
      emit(UserDataLoaded(user: userData));
    } catch (e) {
      emit(UserDataError());
    }
  }
}
