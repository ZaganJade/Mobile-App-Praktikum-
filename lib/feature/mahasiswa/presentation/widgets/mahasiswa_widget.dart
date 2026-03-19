import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../data/models/mahasiswa_model.dart';

class MahasiswaCard extends StatelessWidget {
  final MahasiswaModel mahasiswa;
  final VoidCallback? onTap;

  const MahasiswaCard({Key? key, required this.mahasiswa, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.paddingMedium),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Text(
                      mahasiswa.name.substring(0, 1).toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mahasiswa.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          mahasiswa.email,
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.comment_outlined, size: 16, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                mahasiswa.body,
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MahasiswaListView extends StatelessWidget {
  final List<MahasiswaModel> mahasiswaList;
  final VoidCallback onRefresh;

  const MahasiswaListView({
    Key? key,
    required this.mahasiswaList,
    required this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        itemCount: mahasiswaList.length,
        itemBuilder: (context, index) {
          return MahasiswaCard(
            mahasiswa: mahasiswaList[index],
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Detail: ${mahasiswaList[index].name}'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
