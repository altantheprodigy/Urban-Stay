part of 'phone_login_bloc.dart';

@immutable
abstract class PhoneLoginState {}

class PhoneLoginInitial extends PhoneLoginState {}

class PhoneLoginLoading extends PhoneLoginState {}

class OtpSent extends PhoneLoginState {}

class PhoneLoginSuccess extends PhoneLoginState {}

class PhoneLoginFailure extends PhoneLoginState {
  final String message;
  PhoneLoginFailure(this.message);
}
