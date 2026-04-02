import 'package:dio/dio.dart';
import '../services/local_storage_services.dart';

class DioClient {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  final Dio _dio;
  final LocalStorageService _localStorage;

  DioClient({LocalStorageService? localStorage})
      : _localStorage = localStorage ?? LocalStorageService(),
        _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: {
              'Accept': 'application/json',
            },
          ),
        ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // otomatis ambil token dari SharedPreferences
          final token = await _localStorage.getToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioException error, handler) {
          handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;
}