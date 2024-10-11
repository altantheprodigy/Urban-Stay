import 'package:flutter/material.dart';
import 'package:urban_stay/utils/typography.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: mL),
            const SizedBox(height: 32),
            const Text(
              'Esse nisi sit ea non ex reprehenderit sint irure laborum. Ut pariatur voluptate deserunt sit est duis exercitation consequat sunt mollit do anim cillum. Enim amet do nulla laborum labore cillum consectetur et ut excepteur. Cillum aliqua est fugiat aliquip ut Lorem. Ad cupidatat ipsum dolor commodo consectetur.',
              style: xS,
            )
          ],
        ),
      ),
    );
  }
}