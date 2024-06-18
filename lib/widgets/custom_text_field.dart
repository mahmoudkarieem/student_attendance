import 'package:flutter/material.dart';

class CustomTextFileds extends StatelessWidget {
  CustomTextFileds(
      {Key? key,
      // required this.hintText,

      this.obscureText = false,
      this.controller,
      required this.labelText, this.validator})
      : super(key: key);
  // final String hintText;
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final String ?Function(String?) ?validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText!,
      decoration: InputDecoration(
        // hintText: hintText,
        label: Text(
          labelText,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 25,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8,
          ),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            6,
          ),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
