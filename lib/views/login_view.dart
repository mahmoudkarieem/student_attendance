import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app_attandance/cubits/cubit/user_cubit.dart';
import 'package:student_app_attandance/widgets/forget_password.dart';
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
  //
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignInSucces) {
          Navigator.pushNamed(context, InitalScan.id);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("success"),
            ),
          );
        } else if (state is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
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
                    // key: formKey,
                    key: context.read<UserCubit>().signInFormKey,
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
                                controller:
                                    context.read<UserCubit>().signInEmail,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              CustomTextFileds(
                                obscureText: true,
                                controller:
                                    context.read<UserCubit>().signInPassword,
                                //
                                labelText: 'Password',
                              ),const SizedBox(height: 20,),
                              const ForgetPasswordWidget(),
                              const SizedBox(
                                height: 160,
                              ),
                              state is SignInLoading
                                  ? CircularProgressIndicator()
                                  : GestureDetector(
                                      onTap: () {
                                        context.read<UserCubit>().signIn();
                                        
                                      },
                                      child:  CustomButtomField(
                                        text: 'LOGIN',
                                      ),
                                    ),
                              const SizedBox(
                                height: 40,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
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
                                        Navigator.pushNamed(
                                            context, RegisterView.id);
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
                                ),
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
      },
    );
  }
}
