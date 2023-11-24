class Cost {
  int? id;
  int memberId;
  double amount;
  String costType;
  String details;
  DateTime costDate;
  DateTime? createdAt;

  Cost({
    this.id,
    required this.memberId,
    required this.amount,
    required this.costType,
    required this.details,
    required this.costDate,
    this.createdAt,
  });

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      id: json['id'],
      memberId: json['memberId'],
      amount: json['amount'].toDouble(),
      costType: json['costType'],
      details: json['details'],
      costDate: DateTime.parse(json['costDate']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberId': memberId,
      'amount': amount,
      'costType': costType,
      'details': details,
      'costDate': costDate.toIso8601String(),
    };
  }
}
