import 'package:dio/dio.dart';
import 'package:student_app_attandance/cashe/cashe_helper.dart';
import 'package:student_app_attandance/core/api/end_points.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
    CacheHelper().getData(key: ApiKey.token) != null
        ? '${CacheHelper().getData(key: ApiKey.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
