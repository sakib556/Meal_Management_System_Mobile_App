class UserResponse {
  int? status;
  String? message;
  UserData? data;

  UserResponse({this.status, this.message, this.data});

  factory UserResponse.fromMap(Map<String, dynamic> map) {
    return UserResponse(
      status: map['status'] as int?,
      message: map['message'] as String?,
      data: UserData.fromMap(map['data'] as Map<String, dynamic>?),
    );
  }
}

class UserData {
  String? id;
  String? userName;
  String? email;
  DateTime? createdAt;

  UserData(
      {this.id, required this.userName, required this.email, this.createdAt});

  factory UserData.fromMap(Map<String, dynamic>? map) {
    return UserData(
      id: map?['id'] as String?,
      userName: map?['userName'] as String?,
      email: map?['email'] as String?,
      createdAt: map?['createdAt'] != null
          ? DateTime.parse(map?['createdAt'] as String)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
    };
  }
}
