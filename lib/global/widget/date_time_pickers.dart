import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_management/global/widget/global_space.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/global/widget/titles.dart';
import 'package:meal_management/utils/date_time_util.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

class DateTimePicker extends StatelessWidget {
  final String title;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final String hintDate;
  final String hintTime;
  final String validationDateTitle;
  final String validationTimeTitle;
  final void Function(DateTime) onDatePicked;
  final void Function(TimeOfDay) onTimePicked;
  final bool isRequired;

  const DateTimePicker({
    Key? key,
    required this.onDatePicked,
    required this.onTimePicked,
    this.selectedDate,
    this.selectedTime,
    required this.hintDate,
    required this.hintTime,
    required this.validationDateTitle,
    required this.validationTimeTitle,
    this.isRequired = true,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionRequiredTitle(title: title, isRequired: isRequired),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GlobalDatePicker(
                selectedDate: selectedDate,
                onTap: onDatePicked,
                hint: hintDate,
                validationTitle: validationDateTitle,
              ),
            ),
            const HorizontalSpace(),
            Expanded(
              child: GlobalTimePicker(
                selectedTime: selectedTime,
                onTap: onTimePicked,
                hint: hintTime,
                validationTitle: validationTimeTitle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GlobalTimePicker extends StatefulWidget {
  final TimeOfDay? selectedTime;
  final String? title;
  final String hint;
  final String validationTitle;
  final bool isRequired;
  final Function(TimeOfDay) onTap;
  final IconData? icon;

  const GlobalTimePicker({
    Key? key,
    this.selectedTime,
    this.icon,
    required this.onTap,
    this.title,
    required this.validationTitle,
    this.isRequired = true,
    required this.hint,
  }) : super(key: key);

  @override
  State<GlobalTimePicker> createState() => _GlobalTimePickerState();
}

class _GlobalTimePickerState extends State<GlobalTimePicker> {
  TimeOfDay? selectedTime;
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();

  void validateField(TimeOfDay value) {
    selectedTime = value;
    widget.onTap(value);
    if (widget.isRequired) {
      final currentState = _fieldKey.currentState;
      currentState?.validate();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    selectedTime = widget.selectedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? SectionRequiredTitle(
                title: widget.title!,
                isRequired: widget.isRequired,
              )
            : const SizedBox.shrink(),
        TextFormField(
          key: _fieldKey,
          readOnly: true,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: KColor.softGrey.color,
          ),
          onTap: () async {
            await showTimePicker(
              initialTime: widget.selectedTime ?? TimeOfDay.now(),
              context: context,
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: KColor.primary.color,
                      onPrimary: Colors.white,
                      onSurface: KColor.primary.color,
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        textStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        foregroundColor: KColor.primary.color,
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            ).then((sDate) {
              if (sDate != null) {
                validateField(sDate);
              }
            });
          },
          controller: TextEditingController(
            text: selectedTime != null
                ? "${selectedTime!.hourOfPeriod}:${selectedTime!.minute} ${selectedTime!.period.name} "
                : widget.hint,
          ),
          decoration: buildInputDecoration(
            label: selectedTime == null ? widget.hint : "",
            icon: widget.icon ?? Icons.access_time,
            isRequired: widget.isRequired,
            isDateField: true,
            horizontalPadding: 16,
          ),
          validator: (value) {
            if (widget.isRequired && selectedTime == null) {
              return '${widget.validationTitle} is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class GlobalDatePicker extends StatefulWidget {
  final DateTime? selectedDate;
  final String? title;
  final String hint;
  final String validationTitle;
  final bool isRequired;
  final Function(DateTime) onTap;
  final IconData? icon;

  const GlobalDatePicker({
    Key? key,
    this.selectedDate,
    this.icon,
    required this.onTap,
    this.title,
    this.isRequired = true,
    required this.hint,
    required this.validationTitle,
  }) : super(key: key);

  @override
  State<GlobalDatePicker> createState() => _GlobalDatePickerState();
}

class _GlobalDatePickerState extends State<GlobalDatePicker> {
  DateTime? selectedDate;
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();

  void validateField(DateTime value) {
    selectedDate = value;
    widget.onTap(value);
    if (widget.isRequired) {
      final currentState = _fieldKey.currentState;
      currentState?.validate();
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? SectionRequiredTitle(
                title: widget.title!,
                isRequired: widget.isRequired,
              )
            : const SizedBox.shrink(),
        TextFormField(
          key: _fieldKey,
          readOnly: true,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: KColor.softGrey.color),
          controller: TextEditingController(
              text: selectedDate != null
                  ? DateTimeUtil.dateFormattingYMD(selectedDate!)
                  : widget.hint),
          decoration: buildInputDecoration(
              label: selectedDate == null ? widget.hint : "",
              icon: widget.icon ?? Icons.calendar_today,
              isRequired: widget.isRequired,
              isDateField: true,
              horizontalPadding: 16),
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: widget.selectedDate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2101),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: KColor.primary.color,
                      onPrimary: Colors.white,
                      onSurface: KColor.primary.color,
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        textStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        foregroundColor: KColor.primary.color,
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            ).then((sDate) {
              if (sDate != null) {
                validateField(sDate);
                print("date select ${sDate.toIso8601String()}");
              }
            });
          },
          validator: (value) {
            if (widget.isRequired && selectedDate == null) {
              return '${widget.validationTitle} is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class GlobalDateRangePicker extends StatefulWidget {
  final DateTime firstDayOfMonth;
  final DateTime lastDayOfMonth;
  final Function(DateTimeRange) onDateRangeSelected;
  final Color? borderColor;
  final Color? titleColor;
  const GlobalDateRangePicker({
    super.key,
    required this.firstDayOfMonth,
    required this.lastDayOfMonth,
    required this.onDateRangeSelected,
    this.borderColor,
    this.titleColor,
  });

  @override
  State<GlobalDateRangePicker> createState() => _GlobalDateRangePickerState();
}

class _GlobalDateRangePickerState extends State<GlobalDateRangePicker> {
  late DateTime startDate;
  late DateTime endDate;
  @override
  void initState() {
    startDate = widget.firstDayOfMonth;
    endDate = widget.lastDayOfMonth;
    super.initState();
  }

  void _showGlobalDateRangePicker(BuildContext context) async {
    final pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now().add(const Duration(days: 1000)),
      initialDateRange: DateTimeRange(
        start: widget.firstDayOfMonth,
        end: widget.lastDayOfMonth,
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: KColor.primary.color,
              onPrimary: Colors.white,
              onSurface: KColor.primary.color,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                foregroundColor: KColor.primary.color,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDateRange != null) {
      startDate = pickedDateRange.start;
      endDate = pickedDateRange.end;
      setState(() {});
      widget.onDateRangeSelected(pickedDateRange);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _showGlobalDateRangePicker(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: widget.borderColor ?? KColor.primary.color,
                  width: 1.5),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${DateTimeUtil.dateFormattingYMD(startDate)} to ${DateTimeUtil.dateFormattingYMD(endDate)} ',
                  style: GoogleFonts.montserrat(
                    fontSize: 18.0,
                    color: widget.titleColor ?? KColor.primary.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  color: widget.titleColor ?? KColor.primary.color,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
