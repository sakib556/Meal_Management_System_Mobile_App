import 'package:flutter/material.dart';

@immutable
class CostFormState {
  final bool isButtonLoading; // New property for loading state

  const CostFormState({
    required this.isButtonLoading, // Default to false
  });

  CostFormState copyWith({
    int? memberId,
    double? amount,
    String? costType,
    String? details,
    DateTime? costDate,
    bool? isButtonLoading,
  }) {
    return CostFormState(
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
    );
  }
}
