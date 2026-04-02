import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  static const String _tokenKey = 'auth_token';
  static const String _userIdKey = 'user_id';
  static const String _usernameKey = 'username';
  static const String _savedUsersKey = 'saved_users';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }


  Future<void> saveUser({
    required String userId,
    required String username,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_usernameKey, username);
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_usernameKey);
  }


  /// Helper: buat key berdasarkan kategori
  String _getSavedKey(String category) => '${_savedUsersKey}_$category';

  /// Tambah user ke list (tidak duplikat)
  Future<void> addUserToSavedList({
    required String userId,
    required String username,
    required String category,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getSavedKey(category);
    final rawList = prefs.getStringList(key) ?? [];

    // cek duplikasi berdasarkan user_id
    final isDuplicate = rawList.any((item) {
      final map = jsonDecode(item) as Map<String, dynamic>;
      return map['user_id'] == userId;
    });

    if (isDuplicate) return;

    final newUser = jsonEncode({
      'user_id': userId,
      'username': username,
      'saved_at': DateTime.now().toIso8601String(),
    });

    rawList.add(newUser);
    await prefs.setStringList(key, rawList);
  }

  /// Ambil semua user tersimpan berdasarkan kategori
  Future<List<Map<String, String>>> getSavedUsers({
    required String category,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getSavedKey(category);
    final rawList = prefs.getStringList(key) ?? [];

    return rawList.map((item) {
      final map = jsonDecode(item) as Map<String, dynamic>;
      return {
        'user_id': (map['user_id'] ?? '').toString(),
        'username': (map['username'] ?? '').toString(),
        'saved_at': (map['saved_at'] ?? '').toString(),
      };
    }).toList();
  }

  /// Hapus user tertentu dari list
  Future<void> removeSavedUser(String userId, {required String category}) async {
    final prefs = await SharedPreferences.getInstance();
    final key = _getSavedKey(category);
    final rawList = prefs.getStringList(key) ?? [];

    rawList.removeWhere((item) {
      final map = jsonDecode(item) as Map<String, dynamic>;
      return map['user_id'] == userId;
    });

    await prefs.setStringList(key, rawList);
  }

  /// Hapus semua user di list berdasarkan kategori
  Future<void> clearSavedUsers({required String category}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_getSavedKey(category));
  }


  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}