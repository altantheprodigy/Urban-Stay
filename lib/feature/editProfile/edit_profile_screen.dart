import 'package:flutter/material.dart';
import 'package:urban_stay/feature/editProfile/widgets/custom_textfield.dart';
import 'package:urban_stay/feature/editProfile/widgets/custom_textfield_password.dart';
import 'package:urban_stay/feature/editProfile/widgets/custom_textfield_username.dart';
import 'package:urban_stay/ui/extension.dart';
import '../../ui/color.dart';
import '../../ui/typography.dart';
import '../authentication/widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    usernameController.addListener(_checkForChanges);
    fullNameController.addListener(_checkForChanges);
    phoneController.addListener(_checkForChanges);
    emailController.addListener(_checkForChanges);
  }

  @override
  void dispose() {
    usernameController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _checkForChanges() {
    setState(() {
      isButtonEnabled = usernameController.text.isNotEmpty ||
          fullNameController.text.isNotEmpty ||
          phoneController.text.isNotEmpty ||
          emailController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      appBar: AppBar(
        backgroundColor: black00,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: Text(
          "Edit Profile",
          style: sMBold.copyWith(color: black950),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            _buildInfoProfile(),
            const SizedBox(height: 10),
            _buildEditForm()
          ].withSpaceBetween(height: 5),
        ),
      ),
    );
  }

  Widget _buildInfoProfile() {
    return Center(
      child: Column(
        children: [
          const Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                NetworkImage('https://your-image-url.com/profile.jpg'),
              ),
              Positioned(
                bottom: 0,
                right: 4,
                child: CircleAvatar(
                  backgroundColor: forest600,
                  radius: 18,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          Text('Fulan bin Fulan', style: MBold.copyWith(color: black950)),
          Text(
            '088829190128',
            style: SRegular.copyWith(color: black950),
          ),
        ].withSpaceBetween(height: 5),
      ),
    );
  }

  Widget _buildEditForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextfieldUsername(
            nama: "Fulan123",
            controller: usernameController,
          ),
          CustomTextfield(
            keterangan: "Nama Lengkap",
            hint: "Fulan bin fulan",
            controller: fullNameController,
          ),
          CustomTextfield(
            keterangan: "Nomor HP",
            hint: "(+62) 82134567234",
            controller: phoneController,
          ),
          CustomTextfield(
            keterangan: "Email",
            hint: "Fulan@gmail.com",
            controller: emailController,
          ),
          const CustomButtonProfile(keterangan: "Password", isi: "******"),
          const CustomButtonProfile(keterangan: "Verifikasi KTP", isi: "Terverifikasi"),
          CustomButton(
            onPressed: isButtonEnabled ? () {} : null,
            child: const Text("Simpan Perubahan"),
          ),
        ].withSpaceBetween(height: 12),
      ),
    );
  }
}