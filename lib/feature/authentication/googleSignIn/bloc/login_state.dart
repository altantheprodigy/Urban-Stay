part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginNumberLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String userName;

  LoginSuccess(this.userName);
}

class LoginNumberSuccess extends LoginState {
  final String nomor;

  LoginNumberSuccess(this.nomor);
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}

class OtpSentState extends LoginState {
  final String verificationId;

  OtpSentState(this.verificationId);
}