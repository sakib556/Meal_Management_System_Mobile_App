// class DashboardResponse {
//   int? status;
//   DashboardData? data;
//   String? message;

//   DashboardResponse({
//     this.status,
//     this.data,
//     this.message,
//   });

//   factory DashboardResponse.fromMap(Map<String, dynamic> map) {
//     return DashboardResponse(
//       status: map['status'] as int?,
//       data: DashboardData.fromMap(map['data']),
//       message: map['message'] as String?,
//     );
//   }
// }

// class DashboardData {
//   int? totalMembers;
//   int? totalBazarCost;
//   int? totalUtilityCost;
//   int? totalMeals;
//   dynamic costPerMeal;
//   dynamic utilityCostPerMember;
//   List<MemberDetails>? allMemberDetails;

//   DashboardData({
//     this.totalMembers,
//     this.totalBazarCost,
//     this.totalUtilityCost,
//     this.totalMeals,
//     required this.costPerMeal,
//     required this.utilityCostPerMember,
//     this.allMemberDetails,
//   });

//   factory DashboardData.fromMap(Map<String, dynamic> map) {
//     return DashboardData(
//       totalMembers: map['totalMembers'],
//       totalBazarCost: map['totalBazarCost'],
//       totalUtilityCost: map['totalUtilityCost'],
//       totalMeals: map['totalMeals'],
//       costPerMeal: map['costPerMeal'],
//       utilityCostPerMember: map['utilityCostPerMember'],
//       allMemberDetails: (map['allMemberDetails'] as List<dynamic>?)
//           ?.map((e) => MemberDetails.fromMap(e))
//           .toList(),
//     );
//   }
// }

// class MemberDetails {
//   String? id;
//   String? memberName;
//   String? gender;
//   String? memberTotalBazarCost;
//   String? memberTotalUtilityCost;
//   String? memberTotalMeal;
//   dynamic memberMealCost;
//   int? memberTotalDeposit;
//   dynamic memberAccount;

//   MemberDetails({
//     this.id,
//     this.memberName,
//     this.gender,
//     this.memberTotalBazarCost,
//     this.memberTotalUtilityCost,
//     this.memberTotalMeal,
//     required this.memberMealCost,
//     this.memberTotalDeposit,
//     required this.memberAccount,
//   });

//   factory MemberDetails.fromMap(Map<String, dynamic> map) {
//     return MemberDetails(
//       id: map['id'],
//       memberName: map['memberName'],
//       gender: map['gender'],
//       memberTotalBazarCost: map['memberTotalBazarCost'],
//       memberTotalUtilityCost: map['memberTotalUtilityCost'],
//       memberTotalMeal: map['memberTotalMeal'],
//       memberMealCost: map['memberMealCost'],
//       memberTotalDeposit: map['memberTotalDeposit'],
//       memberAccount: map['memberAccount'],
//     );
//   }
// }
