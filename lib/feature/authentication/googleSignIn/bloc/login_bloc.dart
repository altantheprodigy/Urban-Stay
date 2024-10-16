import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginWithGoogleEvent>((event, emit) async {
      emit(LoginLoading());

      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        if (googleUser == null) {
          emit(LoginFailure("Google Sign-In was canceled"));
          return;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
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

    on<CheckLoginStatusEvent>((event, emit) async {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        emit(LoginSuccess(user.displayName ?? "Unknown"));
      } else {
        emit(LoginInitial());
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
