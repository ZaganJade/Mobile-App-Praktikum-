// import 'dart:io';

// // class Mahasiswa {
// //   String nama = "Mediuun";

// //   void tampilkanData() {
// //     print(nama);
// //   }
// // }

// // void main() {
// //   var mahasiswa1 = Mahasiswa();
// //   mahasiswa1.tampilkanData();

// //   stdout.write("Kasih Nama Baru Kinggg: ");
// //   String? namaBaru = stdin.readLineSync();

// //   if (namaBaru != null && namaBaru.isNotEmpty) {
// //     mahasiswa1.nama = namaBaru;
// //     print("Done yagesyak.");
// //     mahasiswa1.tampilkanData();
// //   } else {
// //     print("Kasih isi lah kingg.");
// //   }
// // }

import 'dart:io';

class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'isi Kingg!!'}");
    print("NIM: ${nim ?? 'isi Kingg!!'}");
    print("Jurusan: ${jurusan ?? 'isi Kingg!!'}");
  }
}

void main() {
  Mahasiswa mahasiswa = Mahasiswa();

  print("Kasih nama sini Kingg:");
  mahasiswa.nama = stdin.readLineSync();

  print("Janlup Masukin Nim juga kingg:");
  mahasiswa.nim = int.tryParse(stdin.readLineSync() ?? '');

  print("Jurusannya jugalah kingzz:");
  mahasiswa.jurusan = stdin.readLineSync();

  mahasiswa.tampilkanData();
}