import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/mahasiswa_provider.dart';
import '../widgets/mahasiswa_widget.dart';

class MahasiswaPage extends ConsumerWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mahasiswaState = ref.watch(mahasiswaListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(mahasiswaListProvider.notifier).getMahasiswaList();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: mahasiswaState.when(
        data: (mahasiswaList) => MahasiswaListView(
          mahasiswaList: mahasiswaList,
          onRefresh: () async {
            ref.read(mahasiswaListProvider.notifier).getMahasiswaList();
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
                  ref.read(mahasiswaListProvider.notifier).getMahasiswaList();
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
