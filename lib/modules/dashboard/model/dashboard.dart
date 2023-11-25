import 'dart:convert';

import 'package:dio/dio.dart';

class DashboardInfo {
  String? totalMembers;
  double? totalBazarCost;
  double? totalUtilityCost;
  String? totalMeals;
  String? costPerMeal;
  String? utilityCostPerMember;
  List<MemberDetails>? allMemberDetails;
// {"totalMembers":"3","totalBazarCost":"4500.00","totalUtilityCost":"4300.00","totalMeals":"7",
// "costPerMeal":642.8571428571429,
// "utilityCostPerMember":1433.3333333333333,
  DashboardInfo({
    this.totalMembers,
    this.totalBazarCost,
    this.totalUtilityCost,
    this.totalMeals,
    this.costPerMeal,
    this.utilityCostPerMember,
    this.allMemberDetails,
  });

  factory DashboardInfo.fromJson(Map<String, dynamic> json) {
    return DashboardInfo(
      totalMembers: json['totalMembers'],
      totalBazarCost: double.parse(json['totalBazarCost']),
      totalUtilityCost: double.parse(json['totalUtilityCost']),
      totalMeals: json['totalMeals'],
      costPerMeal: json['costPerMeal'],
      utilityCostPerMember: json['utilityCostPerMember'],
      allMemberDetails: List<MemberDetails>.from(
        json['allMemberDetails']?.map((x) => MemberDetails.fromJson(x)) ?? [],
      ),
    );
  }
}

class MemberDetails {
  String? id;
  String? memberName;
  String? gender;
  String? memberTotalBazarCost;
  String? memberTotalUtilityCost;
  String? memberTotalMeal;
  String? memberMealCost;
  String? memberTotalDeposit;
  String? memberAccount;
//"allMemberDetails":[{"id":"1","memberName":"Sakib","gender":"Male",
// "memberTotalBazarCost":"2300.00","memberTotalUtilityCost":"1300.00","memberTotalMeal":"6",
// "memberMealCost":3857.1428571428573,
// "memberTotalDeposit":3600,"memberAccount":-1690.4761904761908},
  MemberDetails({
    this.id,
    this.memberName,
    this.gender,
    this.memberTotalBazarCost,
    this.memberTotalUtilityCost,
    this.memberTotalMeal,
    this.memberMealCost,
    this.memberTotalDeposit,
    this.memberAccount,
  });

  factory MemberDetails.fromJson(Map<String, dynamic> json) {
    return MemberDetails(
      id: json['id'],
      memberName: json['memberName'],
      gender: json['gender'],
      memberTotalBazarCost: json['memberTotalBazarCost'],
      memberTotalUtilityCost: json['memberTotalUtilityCost'],
      memberTotalMeal: json['memberTotalMeal'],
      memberMealCost: json['memberMealCost'],
      memberTotalDeposit: json['memberTotalDeposit'],
      memberAccount: json['memberAccount'],
    );
  }
}

Future<DashboardInfo> getDashboardInfo(
    String startDate, String endDate, String userId) async {
  final dio = Dio();

  try {
    final response = await dio.get(
      'https://mealmanagement556.000webhostapp.com/dashboard.php',
      queryParameters: {
        'action': 'getDashboardInfo',
        'startDate': startDate,
        'endDate': endDate,
        'userId': userId,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.data);
      return DashboardInfo.fromJson(data);
    } else {
      throw Exception('Failed to load dashboard info');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}
