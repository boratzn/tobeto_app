import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreenNotifier extends StateNotifier<bool> {
  LoginScreenNotifier() : super(true);

  changeState() {
    state = !state;
  }
}

final loginScreenProvider = StateNotifierProvider<LoginScreenNotifier, bool>(
    (ref) => LoginScreenNotifier());
