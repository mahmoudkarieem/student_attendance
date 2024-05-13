import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app_attandance/views/check_email_view.dart';
import 'package:student_app_attandance/widgets/custom_button_field.dart';
import 'package:student_app_attandance/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 180,
              ),
              Center(child: Image.asset("assets/reset_pass.png",fit: BoxFit.fill,)),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Please enter your email or phone number to receive a code',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30,),
             CustomTextFileds(labelText: "Enter your email"),
              const SizedBox(height: 30,),
              GestureDetector(onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return CheckEmailScreen();
                }));
              },
                  child: CustomButtomField(text: "Reset Password"))
            ],
          ),
        ),
      ),
    );
  }
}
