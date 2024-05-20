// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:qr_code_scanner/qr_code_scanner.dart';
// //
// // import 'package:student_app_attandance/core/errors/exeptions.dart';
// // import 'package:student_app_attandance/cubits/cubit/user_cubit.dart';
// //
// // class ScanQr extends StatefulWidget {
// //   const ScanQr({super.key});
// //
// //   static String id = "Scan QR";
// //
// //   @override
// //   State<ScanQr> createState() => _ScanQrState();
// // }
// //
// // class _ScanQrState extends State<ScanQr> {
// //   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
// //   QRViewController? controller;
// //   bool scanStarted = false;
// //
// //   @override
// //   void dispose() {
// //     controller?.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<UserCubit, UserState>(
// //       listener: (context, state) {
// //         // if (state is ScanSuccess) {
// //         //   ScaffoldMessenger.of(context).showSnackBar(
// //         //     const SnackBar(
// //         //       content: Text("Success"),
// //         //     ),
// //         //   );context.read<UserCubit>().scanQR;
// //         // } else if (state is ScanFailure) {
// //         //   ScaffoldMessenger.of(context).showSnackBar(
// //         //     SnackBar(
// //         //       // content: Text("Failure: ${state.errMessage}"),
// //         //       content: Text(state.errMessage.toString()
// //         //           ),
// //         //     ),
// //         //   );
// //         // }
// //       },
// //       builder: (context, state) {
// //         return Scaffold(
// //           appBar: AppBar(
// //             title: const Text(
// //               "Scan QR Code",
// //               style: TextStyle(
// //                 fontSize: 20,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //           ),
// //           body: Padding(
// //             padding: const EdgeInsets.only(
// //                 top: 80, bottom: 140, right: 20, left: 20),
// //             child: SizedBox(
// //               height: 500,
// //               width: double.infinity,
// //               child: Stack(
// //                 children: [
// //                   _buildQrView(context),
// //                   if (!scanStarted)
// //                     Center(
// //                       child:
// //                      // // state is ScanLoading?const CircularProgressIndicator():
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           // context.read<UserCubit>().scanQR;
// //                           setState(() {
// //                             scanStarted = true;
// //                           });
// //                         },
// //                         child: const Text('Start Scan'),
// //                       ),
// //                     ),
// //                   // state is ScanLoading
// //                   //     ? const Center(child: CircularProgressIndicator())
// //                   //     :
// //                   Positioned(
// //                           top: -80,
// //                           child: ElevatedButton.icon(
// //                             onPressed: () {
// //                               // context.read<UserCubit>().scanQR;
// //                             },
// //                             icon: const Icon(Icons.done),
// //                             label: const Text("Done"),
// //                           ),
// //                         )
// //                 ],
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Widget _buildQrView(BuildContext context) {
// //     return QRView(
// //       key: qrKey,
// //       onQRViewCreated: _onQRViewCreated,
// //       overlay: QrScannerOverlayShape(
// //         borderRadius: 10,
// //         borderColor: Colors.red,
// //         borderLength: 30,
// //         borderWidth: 10,
// //         cutOutSize: MediaQuery.of(context).size.width * 0.8,
// //       ),
// //     );
// //   }
// //
// //   void _onQRViewCreated(QRViewController controller) {
// //     this.controller = controller;
// //     controller.scannedDataStream.listen((scanData) async {
// //       try {
// //         // await context.read<UserCubit>().scanQr(scanData.code);
// //         // await  context.read<UserCubit>().scanQr(scanData.code);
// //
// //         debugPrint("The Scan Data Result :${scanData.code}");
// //       } catch (e) {
// //
// //         print('Error scanning QR code: $e');
// //       }
// //     });
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:student_app_attandance/core/errors/exeptions.dart';
// import 'package:student_app_attandance/cubits/cubit/user_cubit.dart';
// import 'package:student_app_attandance/views/succes_view.dart';
// import 'package:student_app_attandance/widgets/custom_button_field.dart';
// import 'package:student_app_attandance/widgets/custom_text_field.dart';
//
// class ScanQr extends StatefulWidget {
//   const ScanQr({super.key});
//
//   static String id = "Scan QR";
//
//   @override
//   State<ScanQr> createState() => _ScanQrState();
// }
//
// class _ScanQrState extends State<ScanQr> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool scanStarted = false;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserCubit, UserState>(
//       listener: (context, state) {
//         if (state is ScanSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Success"),
//
//             ),
//           );Navigator.pushNamed(context, SuccesView.id);
//         } else if (state is ScanFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text("state.errMessage.toString()"),
//             ),
//           );
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               "Scan QR Code",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.only(
//                 top: 80, bottom: 140, right: 20, left: 20),
//             child: SizedBox(
//               height: 700,
//               width: double.infinity,
//               child: Stack(
//                 children: [
//                   _buildQrView(context),
//                   if (!scanStarted)
//                     Center(
//                       child: state is ScanLoading
//                           ? const CircularProgressIndicator()
//                           : ElevatedButton(
//                           onPressed: () {
// // context.read<UserCubit>().scanQR;
//                           setState(() {
//                             scanStarted = true;
//                           });
//
//                         },
//                         child: const Text('Start Scan'),
//                       ),
//                     ),
//                   if (state is ScanLoading)
//                     const Center(child: CircularProgressIndicator()),
//                   Positioned(
//                     top: -80,
//                     child:        ElevatedButton(onPressed: (){
//
//                     }, child: Icon(Icons.done_all))
//
//
//
//                   )  ],
//         ),
//         ),
//         ));
//       },
//     );
//   }
//
//   Widget _buildQrView(BuildContext context) {
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderRadius: 10,
//         borderColor: Colors.red,
//         borderLength: 30,
//         borderWidth: 10,
//         cutOutSize: MediaQuery.of(context).size.width * 0.8,
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//
//     controller.scannedDataStream.listen((scanData) async {
//       try {
//         await context.read<UserCubit>().scanQr(scanData.code );
//       } catch (e) {
//         print('Error scanning QR code: $e');
//       }
//     });
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:student_app_attandance/cubits/cubit/user_cubit.dart';
// import 'package:student_app_attandance/views/succes_view.dart';
//
// class ScanQr extends StatefulWidget {
//   const ScanQr({super.key});
//
//   static String id = "Scan QR";
//
//   @override
//   State<ScanQr> createState() => _ScanQrState();
// }
//
// class _ScanQrState extends State<ScanQr> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   QRViewController? controller;
//   bool scanStarted = false;
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserCubit, UserState>(
//       listener: (context, state) {
//         if (state is ScanSuccess) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Success")),
//           );
//           Navigator.pushNamed(context, SuccesView.id);
//         } else if (state is ScanFailure) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Failure")),
//           );
//         }
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               "Scan QR Code",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.only(top: 80, bottom: 140, right: 20, left: 20),
//             child: SizedBox(
//               height: 700,
//               width: double.infinity,
//               child: Stack(
//                 children: [
//                   _buildQrView(context),
//                   if (!scanStarted)
//                     Center(
//                       child: state is ScanLoading
//                           ? const CircularProgressIndicator()
//                           : ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             scanStarted = true;
//                           });
//                         },
//                         child: const Text('Start Scan'),
//                       ),
//                     ),
//                   if (state is ScanLoading)
//                     const Center(child: CircularProgressIndicator()),
//                   Positioned(
//                     top: -80,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Handle done action
//                       },
//                       child: const Icon(Icons.done_all),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildQrView(BuildContext context) {
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//         borderRadius: 10,
//         borderColor: Colors.red,
//         borderLength: 30,
//         borderWidth: 10,
//         cutOutSize: MediaQuery.of(context).size.width * 0.8,
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//
//     controller.scannedDataStream.listen((scanData) async {
//       try {
//         await context.read<UserCubit>().scanQr(scanData.code);
//       } catch (e) {
//         print('Error scanning QR code: $e');
//       }
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:student_app_attandance/cubits/cubit/user_cubit.dart';
import 'package:student_app_attandance/views/succes_view.dart';

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
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Success")),
          );
          Navigator.pushNamed(context, SuccesView.id);
        } else if (state is ScanFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text("Failure Scan Try Again")),
          );
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
            padding: const EdgeInsets.only(top: 80, bottom: 140, right: 20, left: 20),
            child: SizedBox(
              height: 700,
              width: double.infinity,
              child: Stack(
                children: [
                  _buildQrView(context),
                  if (!scanStarted)
                    Center(
                      child: state is ScanLoading
                          ? const CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            scanStarted = true;
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
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (!scanStarted) return;
      try {
        await context.read<UserCubit>().scanQr(scanData.code);
       // controller:context.read<UserCubit>().qrCodeScan;
      } catch (e) {
        print('Error scanning QR code: $e');
      } finally {
        setState(() {
          scanStarted = false;
        });
      }
    });
  }
}
