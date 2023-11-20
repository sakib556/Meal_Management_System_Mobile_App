import 'package:dio/dio.dart';
import 'package:meal_management/constant/app_url.dart';

class UserService {
  final Dio _dio = Dio();

  // Replace with your backend URL
  final String baseUrl = AppUrl.base.url;
  Future<String?> createUser(UserModel user) async {
    try {
      final url = '$baseUrl/user.php?action=createUser';
      print('User create url : $url');
      final response = await _dio.post(
        url,
        data: user.toJson(),
      );

      if (response.statusCode == 200) {
        print('User response code 200');
        print(response.data.toString());
        return response.data.toString();
      } else {
        print('Error creating user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating user: $e');
      // throw e;
    }
    return null;
  }

  // Future<String?> createUser(UserModel user) async {
  //   try {
  //     final url = '$baseUrl/user.php?action=createUserModel';
  //     print('User create url : $url');
  //     final response = await _dio.post(
  //       url,
  //       data: user.toJson(),
  //     );
  //     if (response.statusCode == 200) {
  //       print('User response code 200');

  //       return response.data.toString();
  //     }
  //   } catch (e) {
  //     print('Error creating user: $e');
  //     // throw e;
  //   }
  //   return null;
  // }

  Future<void> updateUser(UserModel user) async {
    try {
      await _dio.post(
        '$baseUrl/user.php?action=updateUserModel',
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
        '$baseUrl/user.php?action=deleteUserModel',
        data: {
          'id': id,
        },
      );
    } catch (e) {
      print('Error deleting user: $e');
      throw e;
    }
  }

  Future<List<UserModel>> getUserList() async {
    try {
      final response =
          await _dio.get('$baseUrl/user.php?action=getAllUserModels');
      final userList = (response.data['users'] as List)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList();
      return userList;
    } catch (e) {
      print('Error fetching user list: $e');
      throw e;
    }
  }
}

class UserModel {
  final int? id;
  final String userName;
  final String email;
  final bool isAdmin;
  final bool isManager;
  DateTime? createdAt;
  UserModel({
    this.id,
    required this.userName,
    required this.email,
    required this.isAdmin,
    required this.isManager,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'],
      email: json['email'],
      isAdmin: json['isAdmin'],
      isManager: json['isManager'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'isAdmin': isAdmin.toString(),
      'isManager': isManager.toString(),
    };
  }
}
