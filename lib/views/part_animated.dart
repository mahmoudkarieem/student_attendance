import 'package:flutter/material.dart';
import 'package:student_app_attandance/component/constants.dart';

class InitalPage extends StatelessWidget {
  const InitalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: CircleAvatar(
          radius: 200,
          backgroundImage: AssetImage('assets/tanta.png'),
        ),
      ),
    );
  }
}
