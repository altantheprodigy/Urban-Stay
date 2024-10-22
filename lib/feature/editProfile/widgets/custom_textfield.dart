import 'package:flutter/material.dart';

import '../../../ui/color.dart';
import '../../../ui/typography.dart';

class CustomTextfield extends StatelessWidget {
  final String keterangan;
  final String hint;
  final TextEditingController controller;
  const CustomTextfield({super.key, required this.keterangan, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: black300),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            keterangan,
            style: xSRegular.copyWith(color: black950),
          ),
          TextFormField(
            style: SRegular.copyWith(color: black950),
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: SBold.copyWith(color: black950),
              border: InputBorder.none,
              isDense: true, // Reduces the height of the TextFormField
              contentPadding: EdgeInsets.symmetric(vertical:5.0),
            ),
          ),
        ],
      ),
    );
  }
}
