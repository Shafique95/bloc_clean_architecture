sealed class AuthState{}
class AuthInitState extends AuthState{}
class AuthLoadingState extends AuthState{}
class AuthSuccessState extends AuthState{}
class AuthFailureState extends AuthState{
  final String msg;
  AuthFailureState(this.msg);
}