import 'package:dio/dio.dart';

Dio dioClient() {
  final options = BaseOptions(
    baseUrl: 'https://masak-apa.tomorisakura.vercel.app/',
    connectTimeout: 120000,
    receiveTimeout: 120000,
    contentType: 'application/json',
  );

  var dio = Dio(options);
  return dio;
}
