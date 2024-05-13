import 'package:flutter/material.dart';
import 'package:student_app_attandance/component/constants.dart';

class SuccesView extends StatelessWidget {
  const SuccesView({super.key, });
  static String id = "Success View";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Image.asset('assets/succes_icon.jpeg'),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              ' Your attendace has been registerd Suceesfully',
              style: TextStyle(fontSize: 30, color: kPrimaryColor),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
