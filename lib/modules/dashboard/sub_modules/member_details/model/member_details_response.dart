import 'package:meal_management/modules/dashboard/model/dashboard_response.dart';

class MemberDetailsResponse {
  int status;
  String message;
  MemberDetailsData data;

  MemberDetailsResponse(
      {required this.status, required this.message, required this.data});

  factory MemberDetailsResponse.fromJson(Map<String, dynamic> json) {
    return MemberDetailsResponse(
      status: json['status'],
      message: json['message'],
      data: MemberDetailsData.fromJson(json['data']),
    );
  }
}

class MemberDetailsData {
  List<Cost> costs;
  List<Meal> meals;

  MemberDetailsData({required this.costs, required this.meals});

  factory MemberDetailsData.fromJson(Map<String, dynamic> json) {
    return MemberDetailsData(
      costs:
          (json['costs'] as List).map((cost) => Cost.fromJson(cost)).toList(),
      meals:
          (json['meals'] as List).map((meal) => Meal.fromJson(meal)).toList(),
    );
  }
}

class Cost {
  String id;
  String memberId;
  String amount;
  String costType;
  String details;
  DateTime costDate;
  DateTime createdAt;

  Cost({
    required this.id,
    required this.memberId,
    required this.amount,
    required this.costType,
    required this.details,
    required this.costDate,
    required this.createdAt,
  });

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      id: json['id'],
      memberId: json['memberId'],
      amount: json['amount'],
      costType: json['costType'],
      details: json['details'],
      costDate: DateTime.parse(json['costDate']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Meal {
  String id;
  String memberId;
  String mealCount;
  DateTime mealDate;
  DateTime createdAt;

  Meal({
    required this.id,
    required this.memberId,
    required this.mealCount,
    required this.mealDate,
    required this.createdAt,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      memberId: json['memberId'],
      mealCount: json['mealCount'],
      mealDate: DateTime.parse(json['mealDate']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class MemberParameter {
  MemberDetails member;
  DateTime startDate;
  DateTime endDate;

  MemberParameter({
    required this.member,
    required this.startDate,
    required this.endDate,
  });
}
