// ignore_for_file: unused_field


import 'package:dio/dio.dart';

class ApiServes {
  final _baseUrl = "https://api.coingecko.com/api/v3/";
  final Dio _dio;
  ApiServes(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get("$_baseUrl$endpoint");
    return response.data;
  }
}
