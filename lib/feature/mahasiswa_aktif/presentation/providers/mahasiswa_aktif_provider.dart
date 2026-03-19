import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/mahasiswa_aktif_model.dart';
import '../../data/repositories/mahasiswa_aktif_repository.dart';

final mahasiswaAktifRepositoryProvider = Provider<MahasiswaAktifRepository>((ref) {
  return MahasiswaAktifRepository();
});

final mahasiswaAktifListProvider = StateNotifierProvider<MahasiswaAktifNotifier, AsyncValue<List<MahasiswaAktifModel>>>((ref) {
  return MahasiswaAktifNotifier(ref.watch(mahasiswaAktifRepositoryProvider));
});

class MahasiswaAktifNotifier extends StateNotifier<AsyncValue<List<MahasiswaAktifModel>>> {
  final MahasiswaAktifRepository _repository;

  MahasiswaAktifNotifier(this._repository) : super(const AsyncValue.loading()) {
    getMahasiswaAktifList();
  }

  Future<void> getMahasiswaAktifList() async {
    state = const AsyncValue.loading();
    try {
      final list = await _repository.getMahasiswaAktifList();
      state = AsyncValue.data(list);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }
}
