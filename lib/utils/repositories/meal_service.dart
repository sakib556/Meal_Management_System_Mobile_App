import 'package:dio/dio.dart';
import 'package:meal_management/constant/app_url.dart';
import 'package:meal_management/global/model/meal.dart';

class MealApi {
  static final Dio _dio = Dio();
  static final baseUrl = "${AppUrl.base.url}/meal.php";

  static Future<List<Meal>> getAllMeals() async {
    try {
      final response = await _dio.get('$baseUrl?action=getAllMeals');

      if (response.statusCode == 200) {
        List mealsJson = response.data['meals'];
        List<Meal> meals =
            mealsJson.map((json) => Meal.fromJson(json)).toList();
        return meals;
      } else {
        print("Error $response");
        return [];
      }
    } on DioException catch (e) {
      print("DioException [$e]");
      return [];
    }
  }

  static Future<Meal?> getMealById(int mealId) async {
    try {
      final response = await _dio.get('$baseUrl?action=getMealById&id=$mealId');

      if (response.statusCode == 200) {
        return Meal.fromJson(response.data);
      } else {
        print("Error $response");
        return null;
      }
    } on DioException catch (e) {
      print("DioException [$e]");
      return null;
    }
  }

  static Future<List<Meal>?> getAllMealsByMemberId(int memberId) async {
    try {
      final response = await _dio
          .get('$baseUrl?action=getAllMealsByMemberId&memberId=$memberId');

      if (response.statusCode == 200) {
        List mealsJson = response.data['meals'];
        List<Meal> meals =
            mealsJson.map((json) => Meal.fromJson(json)).toList();
        return meals;
      } else {
        print("Error $response");
        return [];
      }
    } on DioException catch (e) {
      print("DioException [$e]");
      return [];
    }
  }

  static Future<List<Meal>> getAllMealsByUserId(int userId) async {
    try {
      final response =
          await _dio.get('$baseUrl?action=getAllMealsByUserId&userId=$userId');

      if (response.statusCode == 200) {
        List mealsJson = response.data['meals'];
        List<Meal> meals =
            mealsJson.map((json) => Meal.fromJson(json)).toList();
        return meals;
      } else {
        print("Error $response");
        return [];
      }
    } on DioException catch (e) {
      print("DioException [$e]");
      return [];
    }
  }

  static Future<void> createMeal(Meal meal) async {
    try {
      final response = await _dio.post(
        '$baseUrl?action=createMeal',
        data: meal.toJson(),
      );

      print("res ${response.data}...");
      if (response.statusCode == 200) {
        print("Success $response");
      } else {
        print("Error $response");
      }
    } on DioException catch (e) {
      print("DioException [$e]");
    }
  }

  static Future<void> updateMeal(Meal meal) async {
    try {
      final response = await _dio.post(
        '$baseUrl?action=updateMeal',
        data: meal.toJson(),
      );

      if (response.statusCode != 200) {
        print("Error $response");
      }
    } on DioException catch (e) {
      print("DioException [$e]");
    }
  }

  static Future<void> deleteMeal(int mealId) async {
    try {
      final response = await _dio.post(
        '$baseUrl?action=deleteMeal',
        data: {'id': mealId},
      );

      if (response.statusCode != 200) {
        print("Error $response");
      }
    } on DioException catch (e) {
      print("DioException [$e]");
    }
  }

  // Add other CRUD operations as needed
}
