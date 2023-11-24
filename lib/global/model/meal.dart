class Meal {
  int? id;
  int memberId;
  int mealCount;
  DateTime mealDate;
  DateTime? createdAt;

  Meal({
    this.id,
    required this.memberId,
    required this.mealCount,
    required this.mealDate,
    this.createdAt,
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

  Map<String, dynamic> toJson() {
    return {
      'memberId': memberId,
      'mealCount': mealCount,
      'mealDate': mealDate.toIso8601String(),
    };
  }
}
