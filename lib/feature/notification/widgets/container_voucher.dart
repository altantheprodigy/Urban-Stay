import 'package:flutter/material.dart';

import '../../../ui/color.dart';
import '../../../ui/typography.dart';

class ContainerVoucher extends StatelessWidget {
  final String title;
  final String subDesc;
  final String desc;
  const ContainerVoucher({super.key, required this.title, required this.subDesc, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        color: green50,
        border: Border(
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
          Image.asset(
            'assets/images/voucher.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 16,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/hore.png',
                      width: 13,
                      height: 18,
                    ),
                    // const SizedBox(width: 5,),
                    Text(
                      title,
                      style: xSMedium.copyWith(color: black950),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Voucher |',
                      style: xSMedium.copyWith(color: forest600),
                    ),
                    Text(
                      ' 18:46',
                      style: xSMedium.copyWith(color: forest600),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                Text(
                  desc,
                  style: xSMedium.copyWith(color: black500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
