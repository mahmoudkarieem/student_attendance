import 'package:flutter/material.dart';

import '../component/constants.dart';

class CustomButtomField extends StatelessWidget {
   const CustomButtomField({
    super.key,
    required this.text,
    this.color=kPrimaryColor
    , this.colorText=  Colors.white,

  });
  final String text;
  // final Width width;
  // void Function()? onTap;
    final  Color? color;
    final Color? colorText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
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
