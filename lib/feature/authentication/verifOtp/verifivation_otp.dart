import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:urban_stay/pages/home/home_screen.dart';
import 'package:urban_stay/ui/color.dart';

import '../../../ui/typography.dart';
import '../../navigation/navigation_screen.dart';
import '../googleSignIn/bloc/login_bloc.dart';

class OtpVerificationPage extends StatefulWidget {
  final String verificationId;

  const OtpVerificationPage({super.key, required this.verificationId});

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  TextEditingController otpController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginNumberSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Welcome, ${state.nomor}')),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const NavigationScreen()),
              );
            }
          },
          child: Container(
            width: double.infinity,
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
            child: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Verifikasi OTP",
                        style: LBold,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Masukkan kode verifikasi yang dikirimkan lewat SMS ke ",
                        style: SRegular.copyWith(color: black500),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "+6282136608498",
                            style: SRegular.copyWith(color: forest600),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            Icons.edit_outlined,
                            size: 16,
                            color: forest600,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PinCodeTextField(
                        appContext: context,
                        keyboardType: TextInputType.phone,
                        length: 6,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 50,
                          fieldWidth: 50,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          inactiveColor: Colors.grey,
                          selectedFillColor: Colors.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        controller: otpController,
                        onCompleted: (v) {
                          print("Completed: $v");
                        },
                        onChanged: (value) {
                          print(value);
                        },
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: "Belum menerima Kode??",
                                style: xSRegular.copyWith(color: black950),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " Kirim Ulang",
                                    style: xSRegular.copyWith(color: forest600),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap =
                                      (){}, // Call OTP resend function
                                  ),
                                ])),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: forest600,
                              ),
                            );
                          }
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: forest600,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed:
                                  () {
                                context.read<LoginBloc>().add(
                                  VerifyOtpEvent(
                                    widget.verificationId,
                                    otpController.text,
                                  ),
                                );
                              },
                              child:
                                  Text(
                                "Verifikasi",
                                style: MMedium.copyWith(color: black00),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
