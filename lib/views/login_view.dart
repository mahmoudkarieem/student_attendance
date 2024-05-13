import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:student_app_attandance/views/inital_scan_view.dart';
import 'package:student_app_attandance/views/register_view.dart';

import '../component/constants.dart';
import '../widgets/custom_button_field.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/my_logo.dart';
import 'package:http/http.dart' as http;

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });
  static String id = 'Login View';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    const url = 'https://studentapp.runasp.net/api/Account/Login';
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'email': emailController.text,
      'password': passwordController.text,
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        // Login successful, handle the response here
        // For example, you can navigate to the next screen
        debugPrint("Succesfully Login User");
        Navigator.pushNamed(context, InitalScan.id);
        SnakeBarMessage("Login SuccesFully");
      } else {
        // Login failed, handle the error here
        SnakeBarMessage("Login Failed");
      }
    } catch (e) {
      // Exception occurred during the login process, handle the error here
      debugPrint('Exception: $e');
      SnakeBarMessage("An error occurred");
    }
  }

  void SnakeBarMessage(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          const MyLogo(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    160,
                  ),
                ),
              ),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 100,
                          ),
                          CustomTextFileds(
                            //
                            labelText: 'Email',
                            controller: emailController,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextFileds(
                            obscureText: true,
                            //
                            labelText: 'Password',
                            controller: passwordController,
                          ),
                          const SizedBox(
                            height: 180,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                loginUser();
                              } else {
                                // Show error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Please fill out all fields')),
                                );
                              }
                            },
                            child: const CustomButtomField(
                              text: 'LOGIN',
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'you don\'t have an account yet?',
                                style: TextStyle(
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, RegisterView.id);
                                },
                                child: const Text(
                                  ' Sign Up',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
