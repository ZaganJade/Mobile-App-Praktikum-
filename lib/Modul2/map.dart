import 'dart:io';

void main() {
  // Map<String, String> data = {
  //   'MediunFemboy': '08854345679',
  //   'Subriibrii': '08234765434',
  //   'Vickymieayam': '0865234567654',
  // };

  // print("=== DATA AWAL ===");
  // print(data);
  // print("Total data: ${data.length}");

  // stdout.write("\nMasukkan nama yang ingin dicek: ");
  // String cek = stdin.readLineSync()!;

  // if (data.containsKey(cek)) {
  //   print("Data ditemukan: ${data[cek]}");
  // } else {
  //   print("Data tidak ditemukan!");
  // }

  // stdout.write("\nMasukkan nama yang ingin diubah: ");
  // String ubah = stdin.readLineSync()!;

  // if (data.containsKey(ubah)) {
  //   stdout.write("Masukkan nomor baru: ");
  //   String nomorBaru = stdin.readLineSync()!;
  //   data[ubah] = nomorBaru;
  //   print("Data berhasil diubah!");
  // } else {
  //   print("Data tidak ditemukan!");
  // }

  // stdout.write("\nMasukkan nama yang ingin dihapus: ");
  // String hapus = stdin.readLineSync()!;

  // if (data.remove(hapus) != null) {
  //   print("Data berhasil dihapus!");
  // } else {
  //   print("Data tidak ditemukan!");
  // }

  // print("\nSemua Key: ${data.keys}");
  // print("Semua Value: ${data.values}");
  // print("Total data akhir: ${data.length}");

  // print("\n=== DATA AKHIR ===");
  // print(data);

  // print('Data: $data');

  // data['Femboy'] = '087542345678';
  // print('Data setelah ditambahkan: $data');

  // print('Nomor MediunFemboy: ${data['MediunFemboy']}');

   Map<String, Map<String, dynamic>> mahasiswa = {};

  print("=== INPUT DATA MAHASISWA ===");

  stdout.write("Masukkan NIM: ");
  String nim = stdin.readLineSync()!;

  stdout.write("Masukkan Nama: ");
  String nama = stdin.readLineSync()!;

  stdout.write("Masukkan Jurusan: ");
  String jurusan = stdin.readLineSync()!;

  stdout.write("Masukkan IPK: ");
  double ipk = double.parse(stdin.readLineSync()!);

  mahasiswa[nim] = {
    'nama': nama,
    'jurusan': jurusan,
    'ipk': ipk
  };

  print("\nData Mahasiswa: $mahasiswa");

  print("\n=== INPUT MULTIPLE MAHASISWA ===");

  stdout.write("Masukkan jumlah mahasiswa: ");
  int jumlah = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < jumlah; i++) {
    print("\n--- Mahasiswa ke-${i + 1} ---");

    stdout.write("Masukkan NIM: ");
    String nim2 = stdin.readLineSync()!;

    stdout.write("Masukkan Nama: ");
    String nama2 = stdin.readLineSync()!;

    stdout.write("Masukkan Jurusan: ");
    String jurusan2 = stdin.readLineSync()!;

    stdout.write("Masukkan IPK: ");
    double ipk2 = double.parse(stdin.readLineSync()!);

    mahasiswa[nim2] = {
      'nama': nama2,
      'jurusan': jurusan2,
      'ipk': ipk2
    };
  }

  print("\n=== SEMUA DATA MAHASISWA ===");
  mahasiswa.forEach((key, value) {
    print("NIM: $key -> $value");
  });

  print("Total mahasiswa: ${mahasiswa.length}");
}
