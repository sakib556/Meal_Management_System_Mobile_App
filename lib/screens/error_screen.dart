import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.details, this.onPressed});
  final String? details;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              details ?? "Something went wrong.",
              maxLines: 2,
            ),
            const SizedBox(
              height: 20,
            ),
            IconButton(
                onPressed: () => onPressed,
                icon: const Icon(Icons.restart_alt_rounded, size: 80))
          ],
        ),
      ),
    );
  }
}
