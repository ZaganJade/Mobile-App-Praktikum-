import 'dart:io';

void main() {
  Set<String> dataSet = {'a', 'b', 'c', 'd', 'e'};

  print("=== SEMUA DATA ===");
  int no = 1;
  for (var item in dataSet) {
    print("$no. $item");
    no++;
  }

  print("Total data: ${dataSet.length}");

  stdout.write("Masukkan data baru: ");
  String? dataBaru = stdin.readLineSync();

  if (dataSet.add(dataBaru!)) {
    print('Data "$dataBaru" berhasil ditambahkan!');
  } else {
    print('Data "$dataBaru" sudah ada (duplicate)!');
  }

  stdout.write("Masukkan data yang ingin dihapus: ");
  String? hapusData = stdin.readLineSync();

  if (dataSet.remove(hapusData)) {
    print('Data "$hapusData" berhasil dihapus!');
  } else {
    print('Data "$hapusData" tidak ditemukan!');
  }

  stdout.write("Masukkan data yang ingin dicek: ");
  String? cekData = stdin.readLineSync();

  if (dataSet.contains(cekData)) {
    print('Data "$cekData" ada di dalam Set!');
  } else {
    print('Data "$cekData" tidak ada di Set!');
  }

  print("\n=== HASIL AKHIR ===");
  no = 1;
  for (var item in dataSet) {
    print("$no. $item");
    no++;
  }

  print("Total data akhir: ${dataSet.length}");
}
