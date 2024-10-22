import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:urban_stay/ui/color.dart';
import '../../feature/authentication/googleSignIn/bloc/login_bloc.dart';
import '../../feature/authentication/register/register_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc()..add(CheckLoginStatusEvent()),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFDFFFE2),
                Colors.white,
              ],
            ),
          ),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginInitial) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const CircularProgressIndicator(
                    color: forest600,
                  );
                }
                else if (state is LoginNumberSuccess) {
                  // Phone number login success
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome to Home Page, Nomor : ${state.nomor}"),
                        IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            context.read<LoginBloc>().add(LogoutEvent());
                          },
                        ),
                      ],
                    ),
                  );
                }
                else if (state is LoginSuccess) {
                  // Google login success
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome to Home Page, ${state.userName}"),
                        IconButton(
                          icon: const Icon(Icons.logout),
                          onPressed: () {
                            context.read<LoginBloc>().add(LogoutEvent());
                          },
                        ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: Text("Welcome to Home!"),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

