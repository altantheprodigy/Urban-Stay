import 'package:flutter/material.dart';

import '../../../ui/color.dart';
import '../../../ui/typography.dart';

class CustomTextfieldUsername extends StatelessWidget {
  final String nama;
  final TextEditingController controller;
  const CustomTextfieldUsername({super.key, required this.nama, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: black300),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Username',
                  style: xSRegular.copyWith(color: black950),
                ),
                TextFormField(
                  style: SRegular.copyWith(color: black950),
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: nama,
                    hintStyle: SBold.copyWith(color: black950),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
                  ),
                ),
              ],
            ),
          ),
          const CircleAvatar(
            backgroundColor: forest600,
            radius: 10,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 10,
            ),
          ),
        ],
      ),
    );
  }
}
