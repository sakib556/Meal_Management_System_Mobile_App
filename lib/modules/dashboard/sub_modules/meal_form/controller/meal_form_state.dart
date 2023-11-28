import 'package:flutter/material.dart';

@immutable
class MealFormState {
  final bool isButtonLoading; // New property for loading state

  const MealFormState({
    required this.isButtonLoading, // Default to false
  });

  MealFormState copyWith({
    bool? isButtonLoading,
  }) {
    return MealFormState(
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
    );
  }
}
