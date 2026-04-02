import 'package:dio/dio.dart';
import '../models/mahasiswa_model.dart';
import '../../../../core/network/dio_client.dart';

class MahasiswaRepository {
  final DioClient _dioClient;

  MahasiswaRepository({DioClient? dioClient})
      : _dioClient = dioClient ?? DioClient();

  /// GET data daftar mahasiswa
  Future<List<MahasiswaModel>> getMahasiswaList() async {
    try {
      final response = await _dioClient.dio.get('/comments');

      final List<dynamic> data = response.data;

      return data
          .map((json) => MahasiswaModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception(
        'Gagal memuat data mahasiswa: ${e.response?.statusCode} - ${e.message}',
      );
    } catch (e) {
      throw Exception('Terjadi kesalahan: $e');
    }
  }
}
