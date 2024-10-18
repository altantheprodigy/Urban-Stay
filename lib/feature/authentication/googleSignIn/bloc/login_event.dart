part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginWithGoogleEvent extends LoginEvent {}

class LoginWithPhoneEvent extends LoginEvent {
  final String phoneNumber;

  LoginWithPhoneEvent(this.phoneNumber);
}

class VerifyOtpEvent extends LoginEvent {
  final String verificationId;
  final String otp;

  VerifyOtpEvent(this.verificationId, this.otp);
}

class CheckLoginStatusEvent extends LoginEvent {}

class LogoutEvent extends LoginEvent {}
