import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/round_hover_icon_button.dart';
import 'package:meal_management/utils/dialogue_util.dart';
import 'package:meal_management/utils/navigation.dart';

class SheetUtil {
  static ScrollController? bottomSheetController;

  static globalBottomSheet(
      {required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (dContext) {
        return WillPopScope(
          onWillPop: () async {
            final isExit = await DialogueUtil.yesNoDialogue(context);
            if (isExit) {
              Navigation.pop(dContext);
            }
            return false;
          },
          child: DraggableScrollableSheet(
            initialChildSize: 0.7,
            maxChildSize: 0.9,
            minChildSize: 0.5,
            builder: (BuildContext context, ScrollController scrollController) {
              bottomSheetController = scrollController;
              return Stack(
                children: [
                  FractionallySizedBox(
                    heightFactor: 1.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Container(
                              height: 4,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          Expanded(
                            child: child,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: roundHoverIconButton(
                      icon: Icons.close,
                      onTap: () {
                        Navigation.pop(dContext);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  static bottomSheet({
    required BuildContext context,
    bool? isDismissable,
    required Widget content,
    BoxConstraints? boxConstraints,
  }) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      constraints: boxConstraints,
      isScrollControlled: true,
      context: context,
      isDismissible: isDismissable ?? true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x1a000000),
              offset: const Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 0,
            )
          ],
          color: const Color(0xffffffff),
        ),
        child: content,
      ),
    );
  }
}
