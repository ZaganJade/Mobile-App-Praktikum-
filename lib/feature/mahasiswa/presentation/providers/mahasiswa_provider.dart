import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/local_storage_services.dart';
import '../../data/models/mahasiswa_model.dart';
import '../../data/repositories/mahasiswa_repository.dart';

// Repository Provider
final mahasiswaRepositoryProvider = Provider<MahasiswaRepository>((ref) {
  return MahasiswaRepository();
});

// LocalStorage Provider
final mahasiswaLocalStorageServiceProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService();
});

/// Ambil semua user tersimpan
final mahasiswaSavedUsersProvider = FutureProvider<List<Map<String, String>>>((
  ref,
) async {
  final storage = ref.watch(mahasiswaLocalStorageServiceProvider);
  return storage.getSavedUsers(category: 'mahasiswa');
});

/// Ambil user aktif (single user)
final mahasiswaSavedUserProvider = FutureProvider<Map<String, String?>>((ref) async {
  final storage = ref.watch(mahasiswaLocalStorageServiceProvider);

  final userId = await storage.getUserId();
  final username = await storage.getUsername();
  final token = await storage.getToken();

  return {'user_id': userId, 'username': username, 'token': token};
});

/// ================= NOTIFIER =================

class MahasiswaNotifier extends StateNotifier<AsyncValue<List<MahasiswaModel>>> {
  final MahasiswaRepository _repository;
  final LocalStorageService _storage;

  MahasiswaNotifier(this._repository, this._storage)
    : super(const AsyncValue.loading()) {
    loadMahasiswaList();
  }

  Future<void> loadMahasiswaList() async {
    state = const AsyncValue.loading();

    try {
      final data = await _repository.getMahasiswaList();
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> refresh() async {
    await loadMahasiswaList();
  }

  /// Simpan mahasiswa ke local storage (multi user)
  Future<void> saveSelectedMahasiswa(MahasiswaModel mahasiswa) async {
    await _storage.addUserToSavedList(
      userId: mahasiswa.id.toString(),
      username: mahasiswa.name,
      category: 'mahasiswa',
    );
  }

  /// Hapus user tertentu
  Future<void> removeSavedUser(String userId) async {
    await _storage.removeSavedUser(userId, category: 'mahasiswa');
  }

  /// Hapus semua user
  Future<void> clearSavedUsers() async {
    await _storage.clearSavedUsers(category: 'mahasiswa');
  }
}

final mahasiswaNotifierProvider =
    StateNotifierProvider.autoDispose<
      MahasiswaNotifier,
      AsyncValue<List<MahasiswaModel>>
    >((ref) {
      final repository = ref.watch(mahasiswaRepositoryProvider);
      final storage = ref.watch(mahasiswaLocalStorageServiceProvider);

      return MahasiswaNotifier(repository, storage);
    });
