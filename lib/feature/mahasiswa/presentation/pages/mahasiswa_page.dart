import 'package:flutter/material.dart';

class MahasiswaPage extends StatelessWidget {
  const MahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mahasiswa')),
      body: const Center(child: Text('Halaman Mahasiswa')),
    );
  }
}
