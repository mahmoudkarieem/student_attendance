import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:student_app_attandance/cubits/cubit/user_cubit.dart';
import 'package:student_app_attandance/views/failure_view.dart';
import 'package:student_app_attandance/views/succes_view.dart';

import '../core/errors/exeptions.dart';

class ScanQr extends StatefulWidget {
  const ScanQr({super.key});

  static String id = "Scan QR";

  @override
  State<ScanQr> createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool scanStarted = false;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ScanSuccess) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return SuccesView();
          }));
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Success"),
            ),
          );
        }
        if (state is ScanFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("An error occurred while scanning the QR code , try again")),
          );
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const FailureView();
          }));
        }
      },
      builder: (context, state) {
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
          body: Padding(
            padding: const EdgeInsets.only(
                top: 80, bottom: 140, right: 20, left: 20),
            child: SizedBox(
              height: 700,
              width: double.infinity,
              child: Stack(
                children: [ _buildQrView(context),

                  if (!scanStarted)
                    Center(
                      child: state is ScanLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  scanStarted = true;
                                  controller?.resumeCamera();
                                });
                              },
                              child: const Text('Start Scan'),
                            ),
                    ),
                  if (state is ScanLoading)
                    const Center(child: CircularProgressIndicator()),
                  Positioned(
                    top: -80,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle done action
                      },
                      child: const Icon(Icons.done_all),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showSnakeBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderRadius: 10,
        borderColor: Colors.red,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((scanData) async {
      if (!scanStarted) return;
      scanStarted = false;
      controller.pauseCamera(); // Pause the camera to prevent multiple scans
      try {
        await context.read<UserCubit>().scanQr(scanData.code);
        Navigator.pushNamed(context, SuccesView.id);
      }  catch (e) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(content: Text("An error occurred while scanning the QR code.")),
        // );
       Navigator.push(context, MaterialPageRoute(builder: (context){return FailureView();}));
        print('Error scanning QR code: $e');
      }
      // on ServerException catch (e) {
      // debugPrint("ServerException: ${e.errModel.errorMessage}");
      // Navigator.pushNamed(context, FailureView.id);
      //     print('Error scanning QR code: $e');}

    });
  }
}
