import 'package:flutter/material.dart';

import '../component/constants.dart';

class CustomButtomField extends StatelessWidget {
  const CustomButtomField({
    super.key,
    required this.text,
  });
  final String text;
  // final Width width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: kPrimaryColor,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
