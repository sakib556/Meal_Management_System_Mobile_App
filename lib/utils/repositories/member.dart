import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/global/model/member.dart';

class MemberApi {
  static final Dio _dio = Dio();
  static Future<List<Member>> getAllMembers() async {
    final response = await _dio.get('$baseUrl?action=getAllMembers');

    if (response.statusCode == 200) {
      final List<dynamic> memberJsonList = response.data['members'];
      return memberJsonList.map((json) => Member.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load members');
    }
  }

  static Future<List<Member>> getAllMembersByUserId(int userId) async {
    final response =
        await _dio.get('$baseUrl?action=getAllMembersByUserId&userId=$userId');

    if (response.statusCode == 200) {
      final List<dynamic> memberJsonList = response.data['members'];
      return memberJsonList.map((json) => Member.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load members');
    }
  }

  static Future<Member> getMemberById(int memberId) async {
    final response = await _dio.get('d?action=getMemberById&id=$memberId');

    if (response.statusCode == 200) {
      return Member.fromJson(response.data);
    } else {
      throw Exception('Failed to load member');
    }
  }

  static final baseUrl = "${AppUrl.base.url}/member.php";

  static Future<void> createMember(Member member) async {
    try {
      final response = await _dio.post(
        '$baseUrl?action=createMember',
        data: member.toJson(),
      );

      print(" response data is ${response.data}...");
      if (response.statusCode == 200) {
        print(
            "Member created successfully. response data is ${response.data}...");
      } else {
        print("Error creating member. Status code: ${response.statusCode}");
        print("Response data: ${response.data}");
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.unknown && e.error is SocketException) {
        print("Network error: ${e.error}");
      } else {
        print("Dio error: $e");
      }
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

  static Future<void> updateMember(Member member) async {
    final response = await _dio.post(
      '$baseUrl?action=updateMember',
      data: member.toJson(),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update member');
    }
  }
}
