import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitState()) {
    on<LoginEvent>(_loginEvent);
    on<LogOutEvent>(_logOutEvent);
  }
  _loginEvent(LoginEvent lgEvent, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      String email = lgEvent.authEntity.email;
      String password = lgEvent.authEntity.password;
      if (!email.contains("@")) {
        return emit(AuthFailureState("email invalid"));
      } else if (password.length < 4) {
        emit(AuthLoadingState());
        return emit(AuthFailureState("password  must be above 4"));
      }
      // print(state);
      // emit(AuthSuccessState());
      // await Future.delayed(const Duration(seconds: 10),);
      await Future.delayed(
        const Duration(seconds: 3),
        () {
          /// api calling to check userd@
          return emit(AuthSuccessState());
        },
      );
    } on Exception catch (e) {
      return emit(AuthFailureState("password to must be above 6"));
    }
  }

  _logOutEvent(LogOutEvent logoutEvent, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await Future.delayed(
        const Duration(
          seconds: 3,
        ),
        () {
          return emit(
            AuthInitState(),
          );
        },
      );
    } catch (e) {
      emit(AuthFailureState("Failed to logout"));
    }
  }
}
