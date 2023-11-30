import 'package:dio/dio.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/modules/dashboard/model/user_response.dart';

class UserService {
  final Dio _dio = Dio();

  // Replace with your backend URL
  final String baseUrl = AppUrl.base.url;
  Future<String?> createUser(UserData user) async {
    try {
      final url = '$baseUrl/user.php?action=createUser';
      print('User create url : $url');
      final response = await _dio.post(
        url,
        data: user.toMap(),
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

  Future<void> updateUser(UserData user) async {
    try {
      await _dio.post(
        '$baseUrl/user.php?action=updateUserData',
        data: user.toMap(),
      );
    } catch (e) {
      print('Error updating user: $e');
      throw e;
    }
  }

  Future<void> deleteUser(int id) async {
    try {
      await _dio.post(
        '$baseUrl/user.php?action=deleteUserData',
        data: {
          'id': id,
        },
      );
    } catch (e) {
      print('Error deleting user: $e');
      throw e;
    }
  }

  Future<List<UserData>> getUserList() async {
    try {
      final response =
          await _dio.get('$baseUrl/user.php?action=getAllUserDatas');
      final userList = (response.data['users'] as List)
          .map((userJson) => UserData.fromMap(userJson))
          .toList();
      return userList;
    } catch (e) {
      print('Error fetching user list: $e');
      throw e;
    }
  }
}
