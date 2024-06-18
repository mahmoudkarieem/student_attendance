import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app_attandance/component/constants.dart';
import 'package:student_app_attandance/views/enter_new_password.dart';
import 'package:student_app_attandance/widgets/custom_button_field.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          "Check Your Inbox  ",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              Text("Check email Reset Link Has been Sent To Your Email , Please Check Your Inbox Go To Your Inbox",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }


}
