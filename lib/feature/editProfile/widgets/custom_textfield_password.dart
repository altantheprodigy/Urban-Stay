import 'package:flutter/material.dart';

import '../../../ui/color.dart';
import '../../../ui/typography.dart';

class CustomButtonProfile extends StatelessWidget {
  final String keterangan;
  final String isi;
  const CustomButtonProfile({super.key, required this.keterangan, required this.isi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: black300),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                keterangan,
                style: xSRegular.copyWith(color: black950),
              ),
              Text(isi,
                  style: SBold.copyWith(color: black950)),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: black950,
            size: 18,
          ),
        ],
      ),
    );
  }
}
