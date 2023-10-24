import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static Future<String?> getDataTest(
    String url,
  ) async {
    try {
      //final token = ApiConstants().jwtToken;
      //final headers = {'Authorization': 'Bearer $token'};
      if (kDebugMode) print("Start getData $url");
      final response = await http
          .get(
            Uri.parse(url),
            //    headers: headers,
          )
          .timeout(const Duration(seconds: 20));
      if (kDebugMode) print("End getData $url");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (kDebugMode) print('Response is: ${jsonData.toString()}');
        return jsonData.toString();
      } else {
        final jsonData = json.decode(response.body);
        if (kDebugMode) print('Response error: ${jsonData.toString()}');
      }
    } catch (e) {
      if (kDebugMode) print('Error catch: $e');
    }
    return null;
  }

  static Future<T?> getData<T>(
    String url,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      //final token = ApiConstants().jwtToken;
      //final headers = {'Authorization': 'Bearer $token'};
      if (kDebugMode) print("Start getData $url");
      final response = await http
          .get(
            Uri.parse(url),
            //    headers: headers,
          )
          .timeout(const Duration(seconds: 20));
      if (kDebugMode) print("End getData $url");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return fromJson(jsonData);
      } else {
        final jsonData = json.decode(response.body);
        if (kDebugMode) print('Response error: ${jsonData.toString()}');
      }
    } catch (e) {
      if (kDebugMode) print('Error catch: $e');
    }
    return null;
  }

  static Future<T?> getDataList<T>(
    String url,
    T Function(List<dynamic>) fromJson,
  ) async {
    try {
      //  final token = APIConstants.jwtToken;
      //final headers = {'Authorization': 'Bearer $token'};

      if (kDebugMode) print("Start getDataList $url");

      final response = await http
          .get(
            Uri.parse(url),
            //headers: headers,
          )
          .timeout(const Duration(seconds: 20));
      if (kDebugMode) print("End getDataList $url");

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData is List) {
          return fromJson(jsonData);
        } else {
          if (kDebugMode) print('Invalid JSON data type for List');
          return null;
        }
      } else {
        final jsonData = json.decode(response.body);
        if (kDebugMode) print('Response error: ${jsonData.toString()}');
      }
    } catch (e) {
      if (kDebugMode) print('Error catch: $e');
    }
    return null;
  }

  static Future<T?> postData<T>(
    String url,
    dynamic data,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      // final token = APIConstants.jwtToken;
      final headers = {
        //  'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      if (kDebugMode) print(url);

      if (kDebugMode) print("Start postData");

      final response = await http
          .post(
            Uri.parse(url),
            headers: headers,
            body: json.encode(data),
          )
          .timeout(const Duration(seconds: 10));
      if (kDebugMode) print("End postData");

      if (response.statusCode == 201 || response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return fromJson(jsonData);
      } else {
        final jsonData = json.decode(response.body);
        if (kDebugMode) print('Response error: ${jsonData.toString()}');
      }
    } catch (e) {
      if (kDebugMode) print('Error catch: $e');
    }
    return null;
  }

  static Future<bool> putData(
    String url,
    dynamic data,
  ) async {
    try {
      // final token = APIConstants.jwtToken;
      final headers = {
        //  'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      if (kDebugMode) print(url);

      if (kDebugMode) print("Start putData");

      final response = await http
          .put(
            Uri.parse(url),
            headers: headers,
            body: json.encode(data),
          )
          .timeout(const Duration(seconds: 10));
      if (kDebugMode) print("Start putData");

      if (response.statusCode == 200) {
        return true;
      } else {
        final jsonData = json.decode(response.body);
        if (kDebugMode) print('Response error: ${jsonData.toString()}');
        return false;
      }
    } catch (e) {
      if (kDebugMode) print('Error catch: $e');
      return false;
    }
  }

  static Future<bool> deleteData(String url, {required bool hasBody}) async {
    try {
      // final token = APIConstants.jwtToken;
      final headers = {
        //  'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      };
      if (kDebugMode) print(url);

      final response = await (!hasBody
              ? http.delete(
                  Uri.parse(url),
                  headers: headers,
                )
              : http.patch(
                  Uri.parse(url),
                  headers: headers,
                  body: json.encode({"status": "false"}),
                ))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        if (kDebugMode) print('Response success: ${jsonData.toString()}');
        return true;
      } else {
        final jsonData = json.decode(response.body);
        if (kDebugMode) print('Response error: ${jsonData.toString()}');
        return false;
      }
    } catch (e) {
      if (kDebugMode) print('Error catch: $e');
      return false;
    }
  }
}
