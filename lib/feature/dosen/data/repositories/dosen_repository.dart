import 'package:dio/dio.dart';
import '../models/dosen_model.dart';

class DosenRepository {
  final Dio _dio = Dio();

  Future<List<DosenModel>> getDosenList() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
        options: Options(headers: {'Accept': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print(data); // Debug: buat menampilkan data yg sudah di decode
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        print('Error: ${response.statusCode} - ${response.data}');
        throw Exception('Gagal memuat data dosen: ${response.statusCode}');
      }
    } catch (e) {
      print('Dio Error: $e');
      throw Exception('Gagal memuat data dosen: $e');
    }
  }
}
