import 'dart:async';

import 'package:flutter/material.dart';
import 'package:student_app_attandance/views/scan_qr_view.dart';

class InitalScan extends StatelessWidget {
  const InitalScan({super.key});
  static String id = 'Inital qr';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 6), () {
      Navigator.pushNamed(context, ScanQr.id);
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scan QR Code",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Image.asset('assets/frame_qr.png'),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Please Put Your Phone QR Code To Scan It',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //
          ],
        ),
      ),
    );
  }
}
