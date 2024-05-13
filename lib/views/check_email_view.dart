import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app_attandance/views/enter_new_password.dart';
import 'package:student_app_attandance/widgets/custom_button_field.dart';

class CheckEmailScreen extends StatefulWidget {
  @override
  _CheckEmailScreenState createState() => _CheckEmailScreenState();
}

class _CheckEmailScreenState extends State<CheckEmailScreen> {
  int _codeResetTime = 55;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCodeResetTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCodeResetTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _codeResetTime--;
      });

      if (_codeResetTime == 0) {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Check your Email',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 46.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) => _buildCodeField()),
            ),
            SizedBox(height: 26.0),
            SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            Text(
              'Code will reset in $_codeResetTime s',
              style: const TextStyle(color: Colors.grey, fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return EnterPasswordScreen();
                  }));
                }, child: CustomButtomField(text: "Varify")),
            SizedBox(
              height: 37,
            ),
            GestureDetector(
              onTap: () {

              },
              child: const CustomButtomField(
                text: "Send again",
                color: Colors.blue,
                colorText: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCodeField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        width: 80.0,
        height: 80.0,
        child: TextField(
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
          ),
        ),
      ),
    );
  }
}
