import 'package:dio/dio.dart';
import 'package:meal_management/constant/app_url.dart';

class CostService {
  final Dio _dio = Dio();

  // Replace with your backend URL
  final String baseUrl = AppUrl.base.url;

  Future<void> createCost(Cost cost) async {
    try {
      await _dio.post(
        '$baseUrl/cost.php?action=createCost',
        data: cost.toJson(),
      );
    } catch (e) {
      print('Error creating cost: $e');
      throw e;
    }
  }

  Future<void> updateCost(Cost cost) async {
    try {
      await _dio.post(
        '$baseUrl/cost.php?action=updateCost',
        data: cost.toJson(),
      );
    } catch (e) {
      print('Error updating cost: $e');
      throw e;
    }
  }

  Future<void> deleteCost(int id) async {
    try {
      await _dio.post(
        '$baseUrl/cost.php?action=deleteCost',
        data: {
          'id': id,
        },
      );
    } catch (e) {
      print('Error deleting cost: $e');
      throw e;
    }
  }

  Future<List<Cost>> getCostList() async {
    try {
      final response = await _dio.get('$baseUrl/cost.php?action=getCostList');
      final costList = (response.data['costs'] as List)
          .map((costJson) => Cost.fromJson(costJson))
          .toList();
      return costList;
    } catch (e) {
      print('Error fetching cost list: $e');
      throw e;
    }
  }
}

class Cost {
  final int? id;
  final int? userId;
  final String? costType;
  final String? details;
  final double? amount;
  final DateTime? date;
  final String? createdAt;

  Cost({
    this.id,
    this.userId,
    this.costType,
    this.details,
    this.amount,
    this.date,
    this.createdAt,
  });

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      id: json['id'],
      userId: json['userId'],
      costType: json['costType'],
      details: json['details'],
      amount: json['amount']?.toDouble(),
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'costType': costType,
      'details': details,
      'amount': amount,
      'date': date?.toIso8601String(),
      'createdAt': createdAt,
    };
  }
}
