import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static String? cookies;

  static Future init(String baseUrl) async {
    dio = Dio(
      BaseOptions(
        baseUrl: "$baseUrl",
      ),
    );
    dio?.options.connectTimeout = const Duration(milliseconds: 5 * 1000);
    dio?.options.receiveTimeout = const Duration(milliseconds: 5 * 1000);
  }
}
