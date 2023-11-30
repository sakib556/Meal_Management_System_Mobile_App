import 'package:meal_management/modules/dashboard/model/dashboard_response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class MemberDetailsWidget extends StatelessWidget {
  final MemberDetails member;

  const MemberDetailsWidget({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(.2)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: member.memberAccount > 0 ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Balance:  ${member.memberAccount.toString()}',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMemberId(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    // Add an appropriate icon based on gender
                    Icon(
                      member.gender == 'male'
                          ? Icons.person
                          : Icons.person_outline,
                      color: Colors.blue,
                      size: 40,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.memberName ?? '',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Total Bazar Cost: ${member.memberTotalBazarCost}',
                            style: GoogleFonts.lato(),
                          ),
                          Text(
                            'Total Utility Cost: ${member.memberTotalUtilityCost}',
                            style: GoogleFonts.lato(),
                          ),
                          Text(
                            'Total Meal: ${member.memberTotalMeal}',
                            style: GoogleFonts.lato(),
                          ),
                          Text(
                            'Meal Cost: ${member.memberMealCost.toString()}',
                            style: GoogleFonts.lato(),
                          ),
                          Text(
                            'Deposit: ${member.memberTotalDeposit.toString()}',
                            style: GoogleFonts.lato(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberId() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        'ID: ${member.id}',
        style: GoogleFonts.lato(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
