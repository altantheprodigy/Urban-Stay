import 'package:flutter/material.dart';
import 'package:urban_stay/ui/color.dart';

class CustomNotificationSwitch extends StatefulWidget {
  @override
  _CustomNotificationSwitchState createState() => _CustomNotificationSwitchState();
}

class _CustomNotificationSwitchState extends State<CustomNotificationSwitch> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeColor: black00,
      activeTrackColor: forest600,
      inactiveTrackColor: Colors.grey,
      inactiveThumbColor: Colors.white,
    );
  }
}
