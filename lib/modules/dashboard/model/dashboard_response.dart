class DashboardResponse {
  int? status;
  DashboardData? data;
  String? message;

  DashboardResponse({this.status, this.data, this.message});

  factory DashboardResponse.fromMap(Map<String, dynamic> map) {
    return DashboardResponse(
      status: map['status'] as int?,
      data: DashboardData.fromMap(map['data']),
      message: map['message'] as String?,
    );
  }
}

class DashboardData {
  int? totalMembers;
  double? totalBazarCost;
  double? totalUtilityCost;
  int? totalMeals;
  double? costPerMeal;
  double? utilityCostPerMember;
  List<MemberDetails>? allMemberDetails;

  DashboardData({
    this.totalMembers,
    this.totalBazarCost,
    this.totalUtilityCost,
    this.totalMeals,
    this.costPerMeal,
    this.utilityCostPerMember,
    this.allMemberDetails,
  });

  factory DashboardData.fromMap(Map<String, dynamic> map) {
    return DashboardData(
      totalMembers: map['totalMembers'] as int?,
      totalBazarCost: map['totalBazarCost'] as double?,
      totalUtilityCost: map['totalUtilityCost'] as double?,
      totalMeals: map['totalMeals'] as int?,
      costPerMeal: map['costPerMeal'] as double?,
      utilityCostPerMember: map['utilityCostPerMember'] as double?,
      allMemberDetails: (map['allMemberDetails'] as List<dynamic>?)
          ?.map((e) => MemberDetails.fromMap(e))
          .toList(),
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
  double? memberMealCost;
  double? memberTotalDeposit;
  double? memberAccount;

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

  factory MemberDetails.fromMap(Map<String, dynamic> map) {
    return MemberDetails(
      id: map['id']?.toString(),
      memberName: map['memberName'] as String?,
      gender: map['gender'] as String?,
      memberTotalBazarCost: map['memberTotalBazarCost'] as String?,
      memberTotalUtilityCost: map['memberTotalUtilityCost'] as String?,
      memberTotalMeal: map['memberTotalMeal'] as String?,
      memberMealCost: map['memberMealCost'] as double?,
      memberTotalDeposit: map['memberTotalDeposit'] as double?,
      memberAccount: map['memberAccount'] as double?,
    );
  }
}
