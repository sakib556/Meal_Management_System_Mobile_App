class MemberResponse {
  final int status;
  final String message;
  final MemberList data;

  MemberResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MemberResponse.fromJson(Map<String, dynamic> json) {
    return MemberResponse(
      status: json['status'],
      message: json['message'],
      data: MemberList.fromJson(json['data']),
    );
  }
}

class MemberList {
  final List<MemberModel> members;

  MemberList({required this.members});

  factory MemberList.fromJson(Map<String, dynamic> json) {
    var membersList = json['members'] as List;
    List<MemberModel> members =
        membersList.map((member) => MemberModel.fromJson(member)).toList();

    return MemberList(members: members);
  }
}

class MemberModel {
  final String id;
  final String memberName;
  final String gender;
  final String userId;
  final String createdAt;

  MemberModel({
    required this.id,
    required this.memberName,
    required this.gender,
    required this.userId,
    required this.createdAt,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      memberName: json['memberName'],
      gender: json['gender'],
      userId: json['userId'],
      createdAt: json['createdAt'],
    );
  }
}
