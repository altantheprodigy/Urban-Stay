import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:urban_stay/feature/notification/widgets/container_voucher.dart';
import 'package:urban_stay/ui/extension.dart';
import '../../ui/color.dart';
import '../../ui/typography.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black00,
      appBar: AppBar(
        backgroundColor: forest600,
        title: Text(
          "Pemberitahuan",
          style: mLBold.copyWith(
            color: black00,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('dd MMMM yyyy').format(DateTime.now()),
                    style: SSemiBold.copyWith(color: Colors.black),
                  ),
                  Text(
                    'Baca Semua',
                    style: SSemiBold.copyWith(color: blue600),
                  ),
                ],
              ),
            ),
            const ContainerVoucher(
                title: " Extra Voucher mu belum dipakai!",
                subDesc: "subDesc",
                desc:
                    "Promo voucher Diskon 40 RB dari minimum transaksi pembelian RP 800.000.Segera klam voucher tersebut. buruan jangan sampai kehabisan."),
            const ContainerVoucher(
                title: " Extra Voucher mu belum dipakai!",
                subDesc: "subDesc",
                desc:
                    "Promo voucher Diskon 40 RB dari minimum transaksi pembelian RP 800.000.Segera klam voucher tersebut. buruan jangan sampai kehabisan."),
            Container(
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
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
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
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
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
            ),
          ],
        ),
      ),
    );
  }
}
