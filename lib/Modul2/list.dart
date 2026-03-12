import 'dart:io';

void main() {
  //   List<String> names = ['Ihya Sepuh', 'Subrii', 'Vicky mie ayam'];
  //   print('Names: $names');

  //   names.add('Ihya femboy');
  //   print('Nama telah ditambahkan: $names');

  //   print('Nama Pertama : ${names[0]}');
  //   print('Nama Kedua : ${names[1]}');

  //   names[3] = 'Ihya Jomok';
  //   print('Nama Telah dirubah: $names');

  //   names.remove('Ihya Jomok');
  //   print('Nama Telah dihapus: $names');

  //   print('Jumlah Data yg tersimpan: ${names.length}');

  //   print('Menampikan setiap nama:');
  //   for (String name in names) {
  //     print(name);
  //   }

  //   List<String> dataList = [];
  //   print('Data list kosong: $dataList');

  // int count = 0;
  //   while (count <= 0) {
  //     stdout.write("Masukkan jumlah data: ");
  //     String? input = stdin.readLineSync();
  //     try {
  //       count = int.parse(input!);
  //       if (count <= 0) {
  //         print("Masukkan angka lebih dari 0!");
  //       }
  //     } catch (e) {
  //       print("Input tidak valid!");
  //     }
  //   }

  //   for (int i = 0; i < count; i++) {
  //     stdout.write("Data ke-${i + 1}: ");
  //     String? data = stdin.readLineSync();
  //     dataList.add(data!);
  //   }

  //   print("\nData awal: $dataList");

  //   stdout.write("\nMasukkan index yang ingin ditampilkan: ");
  //   int tampilIndex = int.parse(stdin.readLineSync()!);

  //   if (tampilIndex >= 0 && tampilIndex < dataList.length) {
  //     print("Data pada index $tampilIndex: ${dataList[tampilIndex]}");
  //   } else {
  //     print("Index tidak valid!");
  //   }

  //   stdout.write("\nMasukkan index yang ingin diubah: ");
  //   int ubahIndex = int.parse(stdin.readLineSync()!);

  //   if (ubahIndex >= 0 && ubahIndex < dataList.length) {
  //     stdout.write("Masukkan data baru: ");
  //     String? dataBaru = stdin.readLineSync();
  //     dataList[ubahIndex] = dataBaru!;
  //     print("Data berhasil diubah!");
  //   } else {
  //     print("Index tidak valid!");
  //   }

  //   stdout.write("\nMasukkan index yang ingin dihapus: ");
  //   int hapusIndex = int.parse(stdin.readLineSync()!);

  //   if (hapusIndex >= 0 && hapusIndex < dataList.length) {
  //     dataList.removeAt(hapusIndex);
  //     print("Data berhasil dihapus!");
  //   } else {
  //     print("Index tidak valid!");
  //   }

  //   print("\nHasil akhir data list:");
  //   for (int i = 0; i < dataList.length; i++) {
  //     print("Index $i: ${dataList[i]}");
  //   }

  List<String> dataList = [];
  print('Data list kosong: $dataList');

  int count = 0;
  while (count <= 0) {
    stdout.write('Masukkan jumlah list: ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('Masukkan angka lebih dari 0!');
      }
    } catch (e) {
      print('Input tidak valid! Masukkan angka yang benar.');
    }
  }

  for (int i = 0; i < count; i++) {
    stdout.write('data ke-${i + 1}: ');
    String? x = stdin.readLineSync();
    dataList.add(x!);
  }

  print('Data list:');
  print(dataList);
}
