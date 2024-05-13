import 'package:flutter/material.dart';
import 'package:student_app_attandance/views/inital_scan_view.dart';
import 'package:student_app_attandance/views/login_view.dart';
import 'package:student_app_attandance/views/register_view.dart';
import 'package:student_app_attandance/views/scan_qr_view.dart';
import 'package:student_app_attandance/views/splash_view.dart';
import 'package:student_app_attandance/views/succes_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        LoginView.id: (context) => const LoginView(),
        RegisterView.id: (context) => const RegisterView(),
        InitalScan.id: (context) => const InitalScan(),
        ScanQr.id: (context) => const ScanQr(),
        SuccesView.id: (context) => const SuccesView(),
        SplachAnimated.id: (context) => const SplachAnimated()
      },
      initialRoute: LoginView.id,
      debugShowCheckedModeBanner: false,
      home: SplachAnimated(),
    );
  }
}
