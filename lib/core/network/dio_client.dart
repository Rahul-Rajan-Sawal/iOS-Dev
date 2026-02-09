import 'package:dio/dio.dart';

class DioClient{
  static final Dio _dio = Dio(
    BaseOptions(
      connectTimeout:  30000,
      receiveTimeout : 30000,
      responseType: ResponseType.plain,
      headers:{"Content-Type": "application/json"}
    ),
  );

  static Dio get instance => _dio;
}