import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:student_app_attandance/views/succes_view.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});
  static String id = "Scan qr";

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  /*

  // void _onQRViewCreated(QRViewController controller) {
  //   this.controller = controller;
  //   controller.scannedDataStream.listen((scanData) {
  //     setState(() {
  //       result = scanData.code!;
  //     });
  //   });
  // }
  
  Future<void> checkQRCode(String qrCode) async {
    final url = 'YOUR_API_ENDPOINT'; // Replace with your API endpoint
    final headers = {
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'qrCode': qrCode,
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      if (response.statusCode == 200) {
        // QR code matches API response
        setState(() {
          result = 'Success!';
        });
      } else {
        // QR code does not match API response
        setState(() {
          result = 'Failure!';
        });
      }
    } catch (e) {
      // Error occurred during API request
      setState(() {
        result = 'API Error!';
      });
      print('Exception: $e');
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code!;
      });
      checkQRCode(scanData.code!); // Call the checkQRCode method
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scan QR Code in box",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/frame_qr.png',
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SuccesView.id);
              },
              icon: Icon(Icons.next_plan_sharp))
          // QRView(
          //   key: qrKey,
          //   onQRViewCreated: _onQRViewCreated,
          // ),
          // Positioned.fill(
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Text(
          //       result,
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
