import 'package:flutter/foundation.dart';
import 'package:student_app_attandance/core/api/end_points.dart';
import 'package:student_app_attandance/models/login_model.dart';

class SignUpModel {
  final String name;
  final String token;

  final String email;

  SignUpModel({required this.name, required this.email, required this.token});

  factory SignUpModel.fromJson(Map<String, dynamic> jsonData) {
    return SignUpModel(
      name: jsonData[ApiKey.name],
      email: jsonData[ApiKey.email],
      token: jsonData[ApiKey.token],
    );
  }
}
