import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mahasiswa_aktif_provider.dart';
import '../widgets/mahasiswa_aktif_widget.dart';

class MahasiswaAktifPage extends ConsumerWidget {
  const MahasiswaAktifPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(mahasiswaAktifListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa Aktif'),
        backgroundColor: Colors.orangeAccent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(mahasiswaAktifListProvider.notifier).getMahasiswaAktifList();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: postState.when(
        data: (posts) => MahasiswaAktifListView(
          posts: posts,
          onRefresh: () async {
            ref.read(mahasiswaAktifListProvider.notifier).getMahasiswaAktifList();
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () {
                  ref.read(mahasiswaAktifListProvider.notifier).getMahasiswaAktifList();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
