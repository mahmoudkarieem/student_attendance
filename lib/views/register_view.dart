import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app_attandance/cubits/cubit/user_cubit.dart';
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
  //
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Succes"),
          ));
          Navigator.pop(context);
        } else if (state is SignUpFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMessage),
          ));
        }
      },
      builder: (context, state) {
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
                    // key: formKey,
                    key: context.read<UserCubit>().signUpFormKey,
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
                                // controller: userNameController,
                                controller:
                                    context.read<UserCubit>().signUpName,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFileds(
                                // hintText: 'ID',
                                labelText: 'ID',
                                // controller: idController,
                                controller: context.read<UserCubit>().signUpId,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFileds(
                                // hintText: 'Email',
                                labelText: 'Email',
                                controller:
                                    context.read<UserCubit>().signUpEmail,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFileds(
                                obscureText: true,
                                // hintText: 'Password',
                                labelText: 'Password',
                                controller:
                                    context.read<UserCubit>().signUpPassword,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextFileds(
                                obscureText: true,
                                // hintText: 'Password',
                                labelText: 'Confirm Password',
                                controller:
                                    context.read<UserCubit>().confirmPassword,
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              state is SignUpLoading
                                  ? const CircularProgressIndicator()
                                  : GestureDetector(
                                      onTap: () {
                                        context.read<UserCubit>().signUp();
                                      },
                                      child:  CustomButtomField(
                                        text: 'Sign Up',
                                      ),
                                    ),
                              const SizedBox(
                                height: 25,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
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
                                ),
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
      },
    );
  }
}
