part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginWithGoogleEvent extends LoginEvent {}

class CheckLoginStatusEvent extends LoginEvent {}

class LogoutEvent extends LoginEvent {}
