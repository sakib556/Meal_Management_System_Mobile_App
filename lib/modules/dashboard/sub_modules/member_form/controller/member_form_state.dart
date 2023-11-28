import 'package:flutter/material.dart';

@immutable
class MemberFormState {
  final bool isButtonLoading; // New property for loading state

  const MemberFormState({
    required this.isButtonLoading, // Default to false
  });

  MemberFormState copyWith({
    bool? isButtonLoading,
  }) {
    return MemberFormState(
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
    );
  }
}
