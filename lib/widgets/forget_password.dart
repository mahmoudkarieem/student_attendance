
import 'package:flutter/material.dart';
import 'package:student_app_attandance/views/reset_pass_view.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,
    // required this.size,
  });

  // final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: size.width * 0.80,
      width: double.infinity,
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ForgetPasswordView()
            ),
          )
        },
        child: const Text(
          'Forget password?',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}