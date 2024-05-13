import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 150,
      width: 150,
      child: CircleAvatar(
        backgroundImage: AssetImage(
          'assets/tanta.png',
        ),
      ),
    );
  }
}
