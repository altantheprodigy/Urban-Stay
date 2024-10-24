import 'package:flutter/material.dart';
import 'package:urban_stay/ui/extension.dart';

import '../../../ui/color.dart';
import '../../../ui/typography.dart';

class ContainerMaintenance extends StatelessWidget {
  final bool isReaded;
  final bool isImage;
  const ContainerMaintenance({super.key, required this.isReaded, required this.isImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: isReaded ? black00 : green50,
        border: const Border(
          bottom: BorderSide(
            color: black200,
            width: 2.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 21,
            backgroundImage:
            NetworkImage('https://avatar.iran.liara.run/public'),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin Maintenance',
                  style: xSMedium.copyWith(color: black950),
                ),
                Row(
                  children: [
                    Text(
                      'Laporan |',
                      style: xSMedium.copyWith(color: forest600),
                    ),
                    Text(
                      ' 12:00',
                      style: xSMedium.copyWith(color: forest600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Perbaikan AC kamu yang rusak akan di mulai. Teknisi akan segera datang kesana.',
                  style: xSMedium.copyWith(color: black500),
                ),
                const SizedBox(height: 12,),
                if (isImage)
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/service_ac.png',
                        width: 60,
                        height: 60,
                      ),
                      Image.asset(
                        'assets/images/service_ac.png',
                        width: 60,
                        height: 60,
                      ),
                      Image.asset(
                        'assets/images/service_ac.png',
                        width: 60,
                        height: 60,
                      ),
                    ].withSpaceBetween(width: 12),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
