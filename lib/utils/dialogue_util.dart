import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_management/global/widget/custom_button.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

class DialogueUtil {
  static Future<bool> exitDialogue(BuildContext context) async {
    final exitConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Are you sure you want to exit the app?",
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            iconTextButton(
              text: "Cancel",
              onPressed: () {
                Navigator.pop(context, false);
              },
              backgroundColor: KColor.primary.color,
              textColor: Colors.white,
              iconData: Icons.close,
              iconColor: Colors.white,
              borderRadius: 15.0,
              borderWidth: 0.0,
              borderColor: Colors.transparent,
            ),
            iconTextButton(
              text: "Exit",
              onPressed: () {
                Navigator.pop(context, true);
              },
              backgroundColor: Colors.transparent,
              textColor: Colors.black,
              iconData: Icons.exit_to_app,
              iconColor: KColor.softGrey.color,
              borderRadius: 15.0,
              borderWidth: 1.0,
              borderColor: Colors.grey.withOpacity(.70),
            ),
          ],
        );
      },
    );

    if (exitConfirmed == true) {
      SystemNavigator.pop();
    }
    return false;
  }

  static Future<bool> deleteDialogue(BuildContext context) async {
    final deleteConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            "Are you sure you want to delete?",
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            iconTextButton(
              text: "Yes",
              onPressed: () {
                Navigator.pop(context, true);
              },
              backgroundColor: KColor.primary.color,
              textColor: Colors.white,
              iconData: Icons.check,
              iconColor: Colors.white,
              borderRadius: 15.0,
              borderWidth: 0.0,
              borderColor: Colors.transparent,
            ),
            iconTextButton(
              text: "No",
              onPressed: () {
                Navigator.pop(context, false);
              },
              backgroundColor: Colors.transparent,
              textColor: Colors.black,
              iconData: Icons.close,
              iconColor: KColor.softGrey.color,
              borderRadius: 15.0,
              borderWidth: 1.0,
              borderColor: Colors.grey.withOpacity(.70),
            ),
          ],
        );
      },
    );

    if (deleteConfirmed == true) {
      SystemNavigator.pop();
    }
    return false;
  }

  static Future<bool> yesNoDialogue(BuildContext context,
      {String? questionText}) async {
    final exitConfirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            questionText ?? "Are you sure you want to exit the form?",
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            iconTextButton(
              text: "No",
              onPressed: () {
                Navigator.pop(context, false);
              },
              backgroundColor: KColor.primary.color,
              textColor: Colors.white,
              borderRadius: 15.0,
              borderWidth: 0.0,
              borderColor: Colors.transparent,
            ),
            iconTextButton(
              text: "Yes",
              onPressed: () {
                Navigator.pop(context, true);
              },
              backgroundColor: Colors.transparent,
              textColor: Colors.black,
              borderRadius: 15.0,
              borderWidth: 1.0,
              borderColor: Colors.grey.withOpacity(.70),
            ),
          ],
        );
      },
    );

    if (exitConfirmed == true) {
      return true;
    }

    return false;
  }

  static void showEditDeleteDialog(
      {required BuildContext context,
      required void Function() onPressedEdit,
      required void Function() onPressedDelete,
      int? dx,
      int? dy}) {
    final buttonPosition = _getButtonPosition(context);

    final dialogPosition = Offset(
      buttonPosition.dx + (dx ?? 20),
      buttonPosition.dy + (dy ?? 40),
    );

    final overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                overlayEntry!.remove();
              },
              child: Container(
                color: Colors.black.withOpacity(0.0),
              ),
            ),
          ),
          Positioned(
            right: dialogPosition.dx,
            top: dialogPosition.dy,
            child: GestureDetector(
              onTap: () {
                overlayEntry!.remove();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                width: 140,
                height: 130,
                child: Stack(
                  children: [
                    Positioned(
                      top: 5,
                      bottom: 5,
                      right: 5,
                      left: 5,
                      child: Column(
                        children: [
                          Expanded(
                            child: CustomActionRow(
                              onTap: () {
                                overlayEntry!.remove();
                                onPressedEdit();
                              },
                              title: 'Edit',
                              icon: Icons.edit,
                            ),
                          ),
                          Expanded(
                            child: CustomActionRow(
                              onTap: () {
                                overlayEntry!.remove();
                                onPressedDelete();
                              },
                              title: 'Delete',
                              icon: Icons.delete,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlayState.insert(overlayEntry);
  }

  static Offset _getButtonPosition(BuildContext context) {
    final RenderBox buttonRenderBox = context.findRenderObject() as RenderBox;
    final buttonPosition = buttonRenderBox.localToGlobal(Offset.zero);
    return buttonPosition;
  }
}

class CustomActionRow extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData icon;

  const CustomActionRow({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: onTap,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, color: Colors.black),
                      const SizedBox(width: 8),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
