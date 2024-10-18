part of 'phone_login_bloc.dart';

@immutable
abstract class PhoneLoginEvent {}

class SendOtpEvent extends PhoneLoginEvent {
  final String phoneNumber;

  SendOtpEvent(this.phoneNumber);
}

class VerifyOtpEvent extends PhoneLoginEvent {
  final String otp;

  VerifyOtpEvent(this.otp);
}
