

  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:student_app_attandance/component/constants.dart';
  import 'package:student_app_attandance/widgets/custom_text_field.dart';

import '../cubits/cubit/user_cubit.dart';

  class NewPassword extends StatelessWidget{
    const NewPassword({super.key});

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
        if (state is UpdatePasswordSuccess) {

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Success"),
            ),
          );
        } else if (state is UpdatePasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Failure"),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          body: Column(
            children: [const SizedBox(height: 100,),
              CustomTextFileds(labelText: "New Password",
                // controller:
                // context.read<UserCubit>().newPassword,
              ),
              CustomTextFileds(labelText: "Confirm Password",
              // controller:
              // context.read<UserCubit>().confirmNewPassword,
            ),
            ],
          ),
        );
      }  );
    }

  }
