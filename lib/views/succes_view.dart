import 'package:flutter/material.dart';
import 'package:student_app_attandance/component/constants.dart';

class SuccesView extends StatelessWidget {
  const SuccesView({super.key, });
  static String id = "Success View";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset('assets/succes_icon.jpeg'),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                ' Your attendance has been registered Successfully',
                style: TextStyle(fontSize: 30, color: kPrimaryColor),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
