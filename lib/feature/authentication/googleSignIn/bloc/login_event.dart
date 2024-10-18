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

class LoginVerificationCompletedEvent extends LoginEvent {
  final String phoneNumber;

  LoginVerificationCompletedEvent(this.phoneNumber);
}

class LoginVerificationFailedEvent extends LoginEvent {
  final String errorMessage;

  LoginVerificationFailedEvent(this.errorMessage);
}

class OtpSentEvent extends LoginEvent {
  final String verificationId;

  OtpSentEvent(this.verificationId);
}

class LoginFailedEvent extends LoginEvent {
  final String errorMessage;

  LoginFailedEvent(this.errorMessage);
}