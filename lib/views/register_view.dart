import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_app_attandance/views/inital_scan_view.dart';

import '../component/constants.dart';
import '../widgets/custom_button_field.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/my_logo.dart';
import 'package:http/http.dart' as http;

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });

  static String id = 'Register View';

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  void registerUser(String usernameController, String id, String email,
      String password, String confirmPassword) async {
    try {
      var url = Uri.parse('https://studentapp.runasp.net/api/Account/Register');
      var response = await http.post(
        url,
        body: jsonEncode({
          'email': email,
          'name': usernameController,
          'studentId': id,
          'password': password,
          'confirmPassword': confirmPassword,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('Registration successful. Token: ${data['token']}');
      } else {
        print('Failed to register. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
          child: Column(
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
                            height: 50,
                          ),
                          CustomTextFileds(
                            // hintText: 'User Name',
                            labelText: 'User Name',
                            controller: userNameController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFileds(
                            // hintText: 'ID',
                            labelText: 'ID',
                            controller: idController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFileds(
                            // hintText: 'Email',
                            labelText: 'Email',
                            controller: emailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFileds(
                            obscureText: true,
                            // hintText: 'Password',
                            labelText: 'Password',
                            controller: passwordController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFileds(
                            obscureText: true,
                            // hintText: 'Password',
                            labelText: 'Confirm Password',
                            controller: confirmPassController,
                          ),
                          const SizedBox(
                            height: 70,
                          ),
                          GestureDetector(
                            onTap: () {
                              //
                              // Validate form fields
                              if (formKey.currentState!.validate()) {
                                // Get text from text fields
                                String username = userNameController.text;
                                String id = idController.text;
                                String email = emailController.text;
                                String password = passwordController.text;
                                String confirmPassword =
                                    confirmPassController.text;

                                // Call registerUser method
                                registerUser(username, id, email, password,
                                    confirmPassword);
                                Navigator.pushNamed(
                                  context,
                                  InitalScan.id,
                                );
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
                              text: 'Sign Up',
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'you already have an account ?',
                                style: TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  ' Login',
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
          ),
        ],
      )),
    );
  }
}
