import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_login_event.dart';
part 'phone_login_state.dart';

class PhoneLoginBloc extends Bloc<PhoneLoginEvent, PhoneLoginState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? _verificationId;

  PhoneLoginBloc() : super(PhoneLoginInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(PhoneLoginLoading());

      try {
        await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _firebaseAuth.signInWithCredential(credential);
            emit(PhoneLoginSuccess());
          },
          verificationFailed: (FirebaseAuthException e) {
            emit(PhoneLoginFailure(e.message ?? "Verification Failed"));
          },
          codeSent: (String verificationId, int? resendToken) {
            _verificationId = verificationId;
            emit(OtpSent());
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            _verificationId = verificationId;
          },
        );
      } catch (e) {
        emit(PhoneLoginFailure(e.toString()));
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(PhoneLoginLoading());
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!,
          smsCode: event.otp,
        );
        await _firebaseAuth.signInWithCredential(credential);
        emit(PhoneLoginSuccess());
      } catch (e) {
        emit(PhoneLoginFailure(e.toString()));
      }
    });
  }
}
