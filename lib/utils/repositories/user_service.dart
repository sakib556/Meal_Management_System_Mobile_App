import 'package:dio/dio.dart';
import 'package:meal_management/constant/app_url.dart';

class UserService {
  final Dio _dio = Dio();

  // Replace with your backend URL
  final String baseUrl = AppUrl.base.url;

  Future<void> createUser(User user) async {
    try {
      await _dio.post(
        '$baseUrl/user.php?action=createUser',
        data: user.toJson(),
      );
    } catch (e) {
      print('Error creating user: $e');
      throw e;
    }
  }

  Future<void> updateUser(User user) async {
    try {
      await _dio.post(
        '$baseUrl/user.php?action=updateUser',
        data: user.toJson(),
      );
    } catch (e) {
      print('Error updating user: $e');
      throw e;
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await _dio.post(
        '$baseUrl/user.php?action=deleteUser',
        data: {
          'id': id,
        },
      );
    } catch (e) {
      print('Error deleting user: $e');
      throw e;
    }
  }

  Future<List<User>> getUserList() async {
    try {
      final response = await _dio.get('$baseUrl/user.php?action=getAllUsers');
      final userList = (response.data['users'] as List)
          .map((userJson) => User.fromJson(userJson))
          .toList();
      return userList;
    } catch (e) {
      print('Error fetching user list: $e');
      throw e;
    }
  }
}

class User {
  final int? id;
  final String userName;
  final String email;
  final bool isAdmin;
  final bool isManager;

  User({
    this.id,
    required this.userName,
    required this.email,
    required this.isAdmin,
    required this.isManager,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      isAdmin: json['isAdmin'],
      isManager: json['isManager'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'isAdmin': isAdmin,
      'isManager': isManager,
    };
  }
}
