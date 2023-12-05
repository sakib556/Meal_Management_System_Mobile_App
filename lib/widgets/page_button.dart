import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  const PageButton({
    Key? key,
    required this.title,
    required this.isClicked,
    this.onTap,
  }) : super(key: key);
  final String title;
  final bool isClicked;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap!();
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 8,
          decoration: isClicked
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 3.0),
                  ),
                )
              : null,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }
}
