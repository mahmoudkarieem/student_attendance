
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit/user_cubit.dart';
import '../widgets/custom_button_field.dart';
import '../widgets/custom_text_field.dart';
import 'check_email_view.dart';

class  PasswordResetRequestScreen extends StatelessWidget {
  const  PasswordResetRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {



    return BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
      if (state is ResetPasswordSuccess) {

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("success"),
          ),
        );Navigator.of(context).push(MaterialPageRoute(builder: (context){
          return const CheckEmailScreen();
        }));
      } else if (state is ResetPasswordFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.errMessage),
          ),
        );
      }
    },
    builder: (context, state) {
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
                Center(child: Image.asset(
                  "assets/reset_pass.png", fit: BoxFit.fill,)),
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
                CustomTextFileds(labelText: "Enter your email",
                  controller: context
                      .read<UserCubit>()
                      .emailReset,
                ),
                const SizedBox(height: 30,),
                // ... existing code
                GestureDetector(
                  onTap: () async {
context.read<UserCubit>().sendPasswordResetRequest();

                  },
                  child: const CustomButtomField(text: "Reset Password"),
                )
              ],
            ),
          ),
        ),
      );
          }  );
  }
}