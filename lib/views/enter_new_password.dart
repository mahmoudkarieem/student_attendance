import 'package:flutter/material.dart';
import 'package:student_app_attandance/widgets/custom_text_field.dart';

import '../widgets/custom_button_field.dart';

class EnterPasswordScreen extends StatefulWidget {
  @override
  _EnterPasswordScreenState createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter New Password',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 46.0),
          CustomTextFileds(labelText: "NewPassword"),
            const SizedBox(height:30),
            CustomTextFileds(labelText: "ConfirmPassword"),
            SizedBox(height: 80.0),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () {}, child: CustomButtomField(text: "Continuo"),),
            const SizedBox(
              height:37
            ),
            GestureDetector(
              onTap: () {},
              child: const CustomButtomField(
                text: "Cansel",
                color: Colors.blue,
                colorText: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}