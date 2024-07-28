import 'package:bloc_clean_architechture/features/user_auth/domain/entity/auth_entity.dart';

sealed class AuthEvent{}
class LoginEvent extends AuthEvent{
  final AuthEntity authEntity;
  LoginEvent(this.authEntity);
}
class LogOutEvent extends AuthEvent{}