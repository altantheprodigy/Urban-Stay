import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  LoginBloc() : super(LoginInitial()) {

    on<LoginWithGoogleEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          emit(LoginFailure("Google Sign-In was canceled"));
          return;
        }

        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          emit(LoginSuccess(user.displayName ?? "Unknown"));
          await _saveLoginStatus();
        } else {
          emit(LoginFailure("Login failed"));
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        await FirebaseAuth.instance.signOut();
        await GoogleSignIn().signOut();
        await _clearLoginStatus();
        emit(LoginInitial());
      } catch (e) {
        emit(LoginFailure("Logout failed: $e"));
      }
    });

    // Phone Number Login Event Handling
    on<LoginWithPhoneEvent>((event, emit) async {
      emit(LoginNumberLoading());
      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: event.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) async {
            UserCredential userCredential = await _auth.signInWithCredential(credential);
            User? user = userCredential.user;
            if (user != null) {
              // emit(LoginNumberSuccess(user.phoneNumber ?? "Unknown"));
              add(LoginVerificationCompletedEvent(user.phoneNumber ?? "Unknown"));
            }
          },
          verificationFailed: (FirebaseAuthException e) {
            add(LoginVerificationFailedEvent("Phone number verification failed: ${e.message}"));
          },
          codeSent: (String verificationId, int? resendToken) {
            add(OtpSentEvent(verificationId));
            // print("verificationId $verificationId");
          },
          codeAutoRetrievalTimeout: (String verificationId) {
          },
        );
      } catch (e) {
        emit(LoginFailure("Phone login failed: $e"));
      }
    });

    on<LoginVerificationCompletedEvent>((event, emit) async {
      emit(LoginNumberSuccess(event.phoneNumber));
    });

    on<LoginVerificationFailedEvent>((event, emit) {
      emit(LoginFailure(event.errorMessage));
    });

    on<OtpSentEvent>((event, emit) {
      emit(OtpSentState(event.verificationId));
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId,
          smsCode: event.otp,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          emit(LoginNumberSuccess(user.phoneNumber ?? "Unknown"));
          await _saveLoginStatus();
        } else {
          emit(LoginFailure("OTP verification failed"));
        }
      } catch (e) {
        emit(LoginFailure("OTP verification failed: $e"));
      }
    });

    on<CheckLoginStatusEvent>((event, emit) async {
      User? user = _auth.currentUser;

      if (user != null) {
        if (user.displayName != null && user.displayName!.isNotEmpty) {
          emit(LoginSuccess(user.displayName ?? "Unknown"));
        }
        else if (user.phoneNumber != null && user.phoneNumber!.isNotEmpty) {
          emit(LoginNumberSuccess(user.phoneNumber ?? "Unknown"));
        }
      } else {
        emit(LoginInitial());
      }
    });

  }
}

Future<void> _saveLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isLoggedIn', true);
}

Future<void> _clearLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

