import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app_attandance/cashe/cashe_helper.dart';
import 'package:student_app_attandance/core/api/dio_consumer.dart';
import 'package:student_app_attandance/cubits/cubit/user_cubit.dart';
import 'package:student_app_attandance/views/failure_view.dart';
import 'package:student_app_attandance/views/inital_scan_view.dart';
import 'package:student_app_attandance/views/login_view.dart';
import 'package:student_app_attandance/views/register_view.dart';
import 'package:student_app_attandance/views/scan_qr_view.dart';
import 'package:student_app_attandance/views/splash_view.dart';
import 'package:student_app_attandance/views/succes_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(BlocProvider(
    create: (context) => UserCubit(DioConsumer(dio: Dio())),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        InitalScan.id: (context) => const InitalScan(),
        ScanQr.id: (context) => const ScanQr(),
        SuccesView.id: (context) => const SuccesView(),
        SplachAnimated.id: (context) => const SplachAnimated(),
        FailureView.id: (context) => const FailureView()
      },
      initialRoute: LoginView.id,
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
