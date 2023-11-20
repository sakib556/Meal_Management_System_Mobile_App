import 'package:dio/dio.dart';
import 'package:meal_management/constant/app_url.dart';

class MealService {
  final Dio _dio = Dio();

  // Replace with your backend URL
  final String baseUrl = AppUrl.base.url;

  Future<void> createMeal(Meal meal) async {
    try {
      await _dio.post(
        '$baseUrl/meal.php?action=createMeal',
        data: meal.toJson(),
      );
    } catch (e) {
      print('Error creating meal: $e');
      throw e;
    }
  }

  Future<void> updateMeal(Meal meal) async {
    try {
      await _dio.post(
        '$baseUrl/meal.php?action=updateMeal',
        data: meal.toJson(),
      );
    } catch (e) {
      print('Error updating meal: $e');
      throw e;
    }
  }

  Future<void> deleteMeal(int id) async {
    try {
      await _dio.post(
        '$baseUrl/meal.php?action=deleteMeal',
        data: {
          'id': id,
        },
      );
    } catch (e) {
      print('Error deleting meal: $e');
      throw e;
    }
  }

  Future<List<Meal>> getMealList() async {
    try {
      final response = await _dio.get('$baseUrl/meal.php?action=getMealList');
      final mealList = (response.data['meals'] as List)
          .map((mealJson) => Meal.fromJson(mealJson))
          .toList();
      return mealList;
    } catch (e) {
      print('Error fetching meal list: $e');
      throw e;
    }
  }
}

class Meal {
  final int? id;
  final int userId;
  final int mealCount;
  final DateTime date;

  Meal(
      {this.id,
      required this.userId,
      required this.mealCount,
      required this.date});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      userId: json['userId'],
      mealCount: json['mealCount'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'mealCount': mealCount,
      'date': date.toIso8601String(),
    };
  }
}
