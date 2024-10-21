import 'package:flutter/material.dart';

import '../../../ui/color.dart';
import '../../../ui/typography.dart';

class InfoCard extends StatelessWidget {
  final String durasi;
  final String nilai;
  const InfoCard({super.key, required this.durasi, required this.nilai});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          durasi,
          style: xSRegular.copyWith(color: black500),
        ),
        Text(
          nilai,
          style: xSRegular.copyWith(color: black500),
        ),
      ],
    );
  }
}
