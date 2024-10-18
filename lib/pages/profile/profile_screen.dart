import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_stay/pages/profile/widgets/info_card.dart';
import 'package:urban_stay/ui/extension.dart';
import 'package:urban_stay/ui/typography.dart';

import '../../ui/color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: red500, // Adjust background color
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
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150', // Replace with your image
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
                    const SizedBox(height: 10),
                    Text('Fulan bin Fulan',
                        style: MBold.copyWith(color: black950)),
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
                    Container(
                      // width: 300,
                      padding: EdgeInsets.all(10),
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
                                      style: MBold.copyWith(color: forest600)),
                                  SizedBox(height: 10,),
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
                          InfoCard(durasi: "Durasi Sewa", nilai: "Nilai Tagihan Mendatang",),
                          InfoCard(durasi: "Tanggal Mulai Sewa", nilai: "Tgl Tagihan Mendatang",),
                        ].withSpaceBetween(height: 40),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
