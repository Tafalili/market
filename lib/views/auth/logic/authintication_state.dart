part of 'authintication_cubit.dart';

@immutable
sealed class AuthinticationState {}

final class AuthinticationInitial extends AuthinticationState {}

class Login_Loading extends AuthinticationState {}
class Login_Success extends AuthinticationState{}
class Login_Error extends AuthinticationState{
  final String message;
  Login_Error(this.message);
}


class SignUp_Loading extends AuthinticationState {}
class SignUp_Success extends AuthinticationState{}
class SignUp_Error extends AuthinticationState{
  final String message;
  SignUp_Error(this.message);
}

class GoogleSinInLoading extends AuthinticationState {}
class GoogleSinInSuccess extends AuthinticationState{}
class GoogleSinInError extends AuthinticationState{
  final String message;
  GoogleSinInError(this.message);
}