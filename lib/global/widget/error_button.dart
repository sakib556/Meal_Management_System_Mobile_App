import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class GlobalErrorButton extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final VoidCallback onTap;
  final TextStyle? titleTextStyle;
  final Color? buttonColor;

  const GlobalErrorButton({
    super.key,
    this.icon,
    this.title,
    required this.onTap,
    this.titleTextStyle,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              // if (!AuthRepository().tokenIsExpired()) {
              onTap();
              // } else {
              //  EasyLoading.showError("Authentication token expired");
              //   authenticationBloc.add(TokenExpired());
              // }
            },
            icon: Icon(
              icon ?? Icons.error_outline,
              size: 40,
              color: buttonColor ?? Theme.of(context).primaryColor,
            ),
          ),
          Text(
            title ?? "Something went wrong.\nReload please...",
            style: titleTextStyle ??
                const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
          ),
        ],
      ),
    );
  }
}

class ErrorButton extends StatelessWidget {
  final void Function() onTap;
  final String? error;

  const ErrorButton({super.key, required this.onTap, this.error});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlobalErrorButton(
          icon: Icons.error_outline,
          title: error ?? "Oops! Something went wrong",
          onTap: onTap,
        ),
      ],
    );
  }
}

class EmptyButton extends StatelessWidget {
  final void Function() onTap;

  const EmptyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GlobalErrorButton(
          icon: Icons.refresh_outlined,
          title: "No activity found",
          onTap: onTap,
        ),
      ],
    );
  }
}
