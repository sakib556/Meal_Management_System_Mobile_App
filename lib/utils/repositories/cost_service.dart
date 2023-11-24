import 'package:dio/dio.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/global/model/cost.dart';

class CostApi {
  static final Dio _dio = Dio();

  static final String baseUrl = "${AppUrl.base.url}/cost.php";

  static Future<List<Cost>?> getAllCosts() async {
    try {
      final response = await _dio.get('$baseUrl?action=getAllCosts');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['costs'];
        return data.map((json) => Cost.fromJson(json)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  static Future<Cost?> getCostById(int id) async {
    try {
      final response = await _dio.get('$baseUrl?action=getCostById&id=$id');

      if (response.statusCode == 200) {
        return Cost.fromJson(response.data);
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<Cost>?> getAllCostsByMemberId(int memberId) async {
    try {
      final response = await _dio
          .get('$baseUrl?action=getAllCostsByMemberId&memberId=$memberId');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['costs'];
        return data.map((json) => Cost.fromJson(json)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  static Future<List<Cost>?> getAllCostsByUserId(int userId) async {
    try {
      final response =
          await _dio.get('$baseUrl?action=getAllCostsByUserId&userId=$userId');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['costs'];
        return data.map((json) => Cost.fromJson(json)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }

  static Future<void> createCost(Cost cost) async {
    try {
      final response = await _dio.post(
        '$baseUrl?action=createCost',
        data: cost.toJson(),
      );

      print(response.data);
      if (response.statusCode != 200) {
        print(response.data);
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  static Future<void> updateCost(Cost cost) async {
    try {
      final response = await _dio.post(
        '$baseUrl?action=updateCost',
        data: cost.toJson(),
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  static Future<void> deleteCost(int id) async {
    try {
      final response =
          await _dio.post('$baseUrl?action=deleteCost', data: {'id': id});

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } on DioException catch (e) {
      print(e);
    }
  }
}
