import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_stay/pages/profile/widgets/custom_switch.dart';
import 'package:urban_stay/pages/profile/widgets/info_card.dart';
import 'package:urban_stay/pages/profile/widgets/menu_profile_card.dart';
import 'package:urban_stay/ui/extension.dart';
import 'package:urban_stay/ui/typography.dart';

import '../../ui/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: black00,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 250,
                    decoration: const BoxDecoration(
                      color: red500,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'URBANSTAY',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 180,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                'https://via.placeholder.com/150',
                              ),
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text('Fulan bin Fulan', style: MBold.copyWith(color: black950)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+6282136608989",
                    style: xxxXSBold.copyWith(color: black500),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFFFF0000),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Belum terverifikasi",
                      style: xxxXSBold.copyWith(color: black00),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: black300),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Edit Profile",
                  style: xSBold.copyWith(color: black500),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        // width: 300,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: black00,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Status Sewa',
                                        style:
                                            MBold.copyWith(color: forest600)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Edit Profile",
                                      style: xSBold.copyWith(color: black500),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFFF0000),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    "Belum ada sewa aktif",
                                    style: xxxXSBold.copyWith(color: black00),
                                  ),
                                )
                              ],
                            ),
                            const InfoCard(
                              durasi: "Durasi Sewa",
                              nilai: "Nilai Tagihan Mendatang",
                            ),
                            const InfoCard(
                              durasi: "Tanggal Mulai Sewa",
                              nilai: "Tgl Tagihan Mendatang",
                            ),
                          ].withSpaceBetween(height: 40),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: black00,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const MenuProfileCard(
                                imgpath: 'assets/images/maintenance.svg',
                                keterangan: "Panggil Maintenance"),
                            const MenuProfileCard(
                                imgpath: 'assets/images/riwayat.svg',
                                keterangan: "Riwayat"),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset('assets/images/bell.svg',
                                    color: forest600),
                                Expanded(
                                  child: Text(
                                    "Pemberitahuan",
                                    style: SRegular.copyWith(color: blackMenu),
                                  ),
                                ),
                                CustomNotificationSwitch()
                              ].withSpaceBetween(width: 20),
                            ),
                          ].withSpaceBetween(height: 15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: black00,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 5,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const MenuProfileCard(
                                imgpath: 'assets/images/Question.svg',
                                keterangan: "F.A.Q"),
                            const MenuProfileCard(
                                imgpath: 'assets/images/bantuan.svg',
                                keterangan: "Bantuan"),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: forest600,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        "US",
                                        style:
                                            xSRegular.copyWith(color: black00),
                                      ),
                                    ),
                                    Text(
                                      "Tentang Kami",
                                      style:
                                          SRegular.copyWith(color: blackMenu),
                                    ),
                                  ].withSpaceBetween(width: 20),
                                ),
                                const Divider(
                                  color: black200,
                                  height: 1,
                                ),
                              ].withSpaceBetween(height: 15),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset('assets/images/layanan.svg',
                                    color: forest600),
                                Text(
                                  "Kebijakan Layanan & Privasi",
                                  style: SRegular.copyWith(color: blackMenu),
                                ),
                              ].withSpaceBetween(width: 20),
                            ),
                          ].withSpaceBetween(height: 15),
                        ),
                      ),
                    ].withSpaceBetween(height: 20),
                  ))
            ],
          ),
        ));
  }
}
