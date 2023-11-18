class StepperModel {
  final String title;
  final String? statusTime;
  final int status; ////0 = done, 1 = current, 2 = not done

  const StepperModel({
    required this.title,
    required this.statusTime,
    required this.status,
  });
}
