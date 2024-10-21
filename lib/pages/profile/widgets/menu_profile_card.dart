import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_stay/ui/extension.dart';

import '../../../ui/color.dart';
import '../../../ui/typography.dart';


class MenuProfileCard extends StatelessWidget {
  final String imgpath;
  final String keterangan;
  const MenuProfileCard({super.key, required this.imgpath, required this.keterangan});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(imgpath,
                color: forest600),
            Text(
              keterangan,
              style: SRegular.copyWith(color: blackMenu),
            ),
          ].withSpaceBetween(width: 20),
        ),
        const Divider(
          color: black200,
          height: 1,
        ),
      ].withSpaceBetween(height: 15),
    );
  }
}
