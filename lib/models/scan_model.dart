import 'package:student_app_attandance/core/api/end_points.dart';

class ScanModel {
  final int status;
  final String errorMessage;

  ScanModel({required this.status, required this.errorMessage});
  factory ScanModel.fromJson(Map<String, dynamic> jsonData) {
    return ScanModel(
        status: jsonData[ApiKey.status],
        errorMessage: jsonData[ApiKey.message]);
  }
}
