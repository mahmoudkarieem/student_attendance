import 'package:student_app_attandance/core/api/end_points.dart';

class SignInModel {
  final String name;
  final String token;
  final String email;

  SignInModel({required this.email, required this.name, required this.token});

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      email: jsonData[ApiKey.email],
      name: jsonData[ApiKey.name],
      token: jsonData[ApiKey.token],
    );
  }
}
