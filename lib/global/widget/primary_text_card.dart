import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_management/global/widget/title_value.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

class PrimaryTextCard extends StatelessWidget {
  const PrimaryTextCard({
    Key? key,
    required this.id,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.onTap,
    this.firstExpanded = 5,
    this.hasDotButton = false,
    this.hasDeleteButton = false,
  }) : super(key: key);

  final String id;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final bool hasDotButton;
  final bool hasDeleteButton;
  final VoidCallback onTap;
  final int firstExpanded;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: KColor.grey.color),
          color: Colors.white, // Background color
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Subtle shadow
              // spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: hasDotButton ? null : onTap,
            child: Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: KColor.primary.color, // Customize the color
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    id,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 10,
                  bottom: 10,
                  right: 10,
                  child: Row(
                    children: [
                      Expanded(
                        flex: firstExpanded,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              text1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: KColor.black.color),
                            ),
                            Text(
                              text2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: KColor.deep.color),
                            ),
                            Text(
                              text3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color:
                                      KColor.deepGrey.color // Adjust font size
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              text4,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: KColor.deepGrey.color),
                            ),
                            Text(
                              text5,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: KColor.deepGrey.color),
                            ),
                          ],
                        ),
                      ),
                      hasDotButton
                          ? SizedBox(
                              width: 60,
                              child: Center(
                                child: IconButton(
                                    onPressed: onTap,
                                    icon: Center(
                                      child: Icon(hasDeleteButton
                                          ? Icons.delete
                                          : Icons.more_vert),
                                    )),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.text5,
    required this.text6,
  }) : super(key: key);

  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 100,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: KColor.deepGrey.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            titleValueWidget("Id :", text1),
            titleValueWidget("Date :", text2),
            titleValueWidget("Debit account :", text3),
            titleValueWidget("Credit account :", text4),
            titleValueWidget("Amount :", text5),
            titleValueWidget("Particulars :", text6),
          ],
        ),
      ),
    );
  }
}
