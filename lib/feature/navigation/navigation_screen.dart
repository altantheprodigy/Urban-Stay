import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:urban_stay/feature/notification/notification_screen.dart';
import 'package:urban_stay/ui/color.dart';
import 'package:urban_stay/ui/typography.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _initialIndex = 0;

  List<Widget> screens = [
    const HomePage(),
    const NotificationScreen(),
    const Placeholder(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_initialIndex),
      bottomNavigationBar:
          Theme(
              data: ThemeData(),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                    backgroundColor: forest600,
                    elevation: 1,
                    iconSize: 24,
                    currentIndex: _initialIndex,
                    enableFeedback: false,
                    unselectedLabelStyle: xSMedium.copyWith(color: black00),
                    selectedLabelStyle: xSMedium.copyWith(color: black00),
                    selectedItemColor: black00,
                    unselectedItemColor: black00,
                    onTap: (e) {
                      setState(() {
                        _initialIndex = e;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: 'Home',
                        icon: SvgPicture.asset('assets/images/ic_home.svg', color: black00),
                        activeIcon: SvgPicture.asset('assets/images/ic_home.svg', color: black00),
                      ),
                      BottomNavigationBarItem(
                        label: 'Maintenance',
                        icon: SvgPicture.asset('assets/images/Ticket.svg', color: black00),
                        activeIcon: SvgPicture.asset('assets/images/Ticket.svg', color: black00),
                      ),
                      BottomNavigationBarItem(
                        label: 'Riwayat',
                        icon: SvgPicture.asset('assets/images/History.svg', color: black00),
                        activeIcon: SvgPicture.asset('assets/images/History.svg', color: black00),
                      ),
                      BottomNavigationBarItem(
                        label: 'Profil',
                        icon: SvgPicture.asset('assets/images/User.svg', color: black00),
                        activeIcon: SvgPicture.asset('assets/images/User.svg', color: black00),
                      ),
                    ]
                ),
              )
          ),
    );
  }
}
