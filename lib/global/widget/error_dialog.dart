import 'package:flutter/material.dart';
import 'package:meal_management/global/widget/global_text.dart';
import 'package:meal_management/utils/navigation.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    Key? key,
    required this.erroMsg,
  }) : super(key: key);

  final List<String> erroMsg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigation.pop(Navigation.key.currentContext);
              },
              child: const Icon(Icons.close),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              erroMsg.length,
              (index) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.only(right: 30),
                      child: GlobalText(
                        "${erroMsg[index].toString()}",
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff999999),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
