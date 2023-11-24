class Member {
  int? id;
  String memberName;
  String gender;
  int userId;
  DateTime? createdAt;

  Member({
    this.id,
    required this.memberName,
    required this.gender,
    required this.userId,
    this.createdAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      memberName: json['memberName'],
      gender: json['gender'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'memberName': memberName,
      'gender': gender,
      'userId': userId,
    };
  }
}
