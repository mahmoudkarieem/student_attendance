import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:student_app_attandance/core/api/api_consumer.dart';
import 'package:student_app_attandance/core/api/end_points.dart';
import 'package:student_app_attandance/core/errors/exeptions.dart';
import 'package:student_app_attandance/models/login_model.dart';
import 'package:student_app_attandance/models/register_model.dart';
import 'package:student_app_attandance/models/scan_model.dart';

import '../../cashe/cashe_helper.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();

  //Sign in email
  TextEditingController signInEmail = TextEditingController();

  //Sign in password
  TextEditingController signInPassword = TextEditingController();

  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //Profile Pic
  // XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();

  //Sign up phone number
  TextEditingController signUpId = TextEditingController();

  //Sign up email
  TextEditingController signUpEmail = TextEditingController();

  //Sign up password
  TextEditingController signUpPassword = TextEditingController();

  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  ///////Scan qr
  TextEditingController scanQR = TextEditingController();
  TextEditingController messageScanQr = TextEditingController();
  TextEditingController qrCodeScan = TextEditingController();

  /////////

  SignInModel? user;
  SignUpModel? userModel;
  ScanModel ? scanModel;

  ////////////////////////////
  TextEditingController emailReset = TextEditingController();

  // CameraController? _cameraController;
  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: signInEmail.text,
          ApiKey.password: signInPassword.text,
        },
      );
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);

      // final decodeedToken= JwtDecoder.decode(user!.token);

      CacheHelper().saveData(key: ApiKey.token, value: user?.token);
      // CacheHelper().saveData(key: ApiKey.id, value: decodedToken?[ApiKey.id]);
      emit(SignInSucces());
    } on ServerException catch (e) {
      emit(
        SignInFailure(errMessage: e.errModel.errorMessage),
      );
      emit(
        SignInFailure(
          errMessage: e.errModel.status.toString(),
        ),
      );
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await api.post(EndPoint.signUp, data: {
        ApiKey.name: signUpName.text,
        ApiKey.email: signUpEmail.text,
        ApiKey.password: signUpPassword.text,
        ApiKey.confirmPassword: confirmPassword.text,
        ApiKey.studentId: signUpId.text,
      });
      print('SignUp response: $response');

      // Check if the response is a JSON string and decode it
      final responseData = response is String ? jsonDecode(response) : response;
      emit(SignUpSuccess());

      userModel = SignUpModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(userModel!.token);

      CacheHelper().saveData(key: ApiKey.token, value: userModel?.token);
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errModel.errorMessage));
    }
  }


  // scanQr(String? qrCode) async {
  //   try {
  //     emit(ScanLoading());
  //     final token = await CacheHelper().getData(key: ApiKey.token);
  //     debugPrint("Token $token");
  //
  //     final response = await api.post(
  //       EndPoint.scanQr,
  //       data: {
  //         ApiKey.scannedQR: qrCode,
  //       },
  //     );
  //      emit(ScanSuccess());
  //
  //   } on ServerException catch (e) {
  //     emit(ScanFailure(errMessage: e.errModel.errorMessage));
  //   }
  //   catch (e) {
  //     emit(ScanFailure(errMessage: e.toString()));
  //   }
  // }

   scanQr(String? qrCode) async {
    try {
      if (qrCode == null || qrCode.isEmpty) {
        emit(ScanFailure(errMessage: "QR Code is null or empty"));
        return;
      }

      debugPrint("Scanned QR Code: $qrCode");

      emit(ScanLoading());

      final token = await CacheHelper().getData(key: ApiKey.token);
      debugPrint("Token: $token");

      final response = await api.post(
        EndPoint.scanQr,
        data: {
          ApiKey.scannedQR: qrCode.toString(),
          // ApiKey.message:messageScanQr.text

        },
        queryParameters:token,

      );

      debugPrint("Response: ${response.data}");
      emit(ScanSuccess());

    } on ServerException catch (e) {
      debugPrint("ServerException: ${e.errModel.errorMessage}");
      emit(ScanFailure(errMessage: e.errModel.errorMessage));
    } catch (e) {
      debugPrint("Exception: $e");
      emit(ScanFailure(errMessage: e.toString()));
    }
  }



  forgetPassword() {
    try {
      emit(ResetPasswordLoading());
      final response = api.post(EndPoint.forgetPassword,
          data: {ApiKey.emailReset: emailReset.text});
      emit(ResetPasswordSuccess());
    } on ServerException catch (e) {
      emit(ResetPasswordFailure(errMessage: e.toString()));
    }
  }
}


