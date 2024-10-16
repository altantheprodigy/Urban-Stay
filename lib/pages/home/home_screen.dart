import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/authentication/googleSignIn/bloc/login_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(CheckLoginStatusEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginSuccess) {
              return Center(
                child: Text("Welcome to Home Page, ${state.userName}"),
              );
            }
            return const Center(
              child: Text("Welcome to Home!"),
            );
          },
        ),
      ),
    );
  }
}
