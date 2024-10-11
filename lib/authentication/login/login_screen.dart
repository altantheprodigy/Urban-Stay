import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urban_stay/authentication/register/register_screen.dart';
import 'package:urban_stay/authentication/widgets/custom_button.dart';
import 'package:urban_stay/authentication/widgets/cutom_button1.dart';
import 'package:urban_stay/utils/color.dart';
import 'package:urban_stay/utils/typography.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPhoneValid = true;
  bool _isAgreementChecked = false;
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _countryCodes = [
    {'code': '+62', 'flag': 'assets/images/id.png'},
    {'code': '+1', 'flag': 'assets/images/id.png'},
    {'code': '+91', 'flag': 'assets/images/id.png'},
    {'code': '+81', 'flag': 'assets/images/id.png'},
  ];
  String _selectedCountryCode = '+62';

  void _validatePhoneNumber() {
    setState(() {
      if (_phoneController.text.length < 12) {
        _isPhoneValid = false;
      } else {
        _isPhoneValid = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 109.53,
                          height: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        "Masuk Akun",
                        style: lBold,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Pastikan menggunakan nomor yang sudah terdafar ya!",
                        style: S.copyWith(color: black500),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Nomor Telepon",
                        style: S.copyWith(color: black950),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: _isPhoneValid
                                ? Colors.grey.shade300
                                : Colors.red,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: _selectedCountryCode,
                                  items: _countryCodes
                                      .map((Map<String, String> country) {
                                    return DropdownMenuItem<String>(
                                      value: country['code'],
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            country['flag']!,
                                            width: 25,
                                            height: 25,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            country['code']!,
                                            style: sM.copyWith(color: black500),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedCountryCode = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                              width: 1,
                              thickness: 1,
                              indent: 10,
                              endIndent: 10,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _phoneController,
                                style: sM.copyWith(color: black950),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: '853xxxxxxx',
                                  hintStyle: sM.copyWith(color: black500),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                ),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(12)
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _isAgreementChecked = value.isNotEmpty;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          onPressed: _isAgreementChecked
                              ? () {
                                  _validatePhoneNumber();
                                  if (_isPhoneValid) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Nomor telepon valid')),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Nomor telepon tidak valid')),
                                    );
                                  }
                                }
                              : null,
                          child: const Text("Masuk")),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Divider(
                              color: black200,
                              height: 1,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Atau masuk dengan",
                              style: S.copyWith(color: black950),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: black200,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton1(
                        border: Border.all(color: black300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/image 9.png',
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Daftar dengan Google",
                              style: M.copyWith(color: black950),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton1(
                        border: Border.all(color: black300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/apple.png',
                              height: 25,
                              width: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Daftar dengan Apple ID",
                              style: M.copyWith(color: black950),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                                text: "Belum punya akun?",
                                style: xS.copyWith(color: black950),
                                children: <TextSpan>[
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const RegisterScreen()),
                                          );
                                        },
                                      text: " Daftar",
                                      style: xS.copyWith(
                                        color: forest600,
                                      ))
                                ])),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
