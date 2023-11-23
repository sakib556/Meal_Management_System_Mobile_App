import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_management/global/widget/text_fields.dart';
import 'package:meal_management/global/widget/titles.dart';
import 'package:meal_management/utils/styles/k_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GlobalDropDown extends StatefulWidget {
  final String title;
  final List<NameId> items;
  final ValueChanged<int> onChanged;
  final int? selectedId;
  final double? width;
  final int? sourceId;
  final bool isRequired;
  final bool isLoading;
  final bool isError;
  final void Function()? onErrorTap;
  final bool isUpdateButton;
  const GlobalDropDown({
    Key? key,
    this.width,
    required this.title,
    required this.onChanged,
    required this.items,
    required this.selectedId,
    this.sourceId,
    this.isLoading = false,
    this.isError = false,
    this.onErrorTap,
    this.isRequired = true,
    this.isUpdateButton = false,
  }) : super(key: key);

  @override
  State<GlobalDropDown> createState() => _GlobalDropDownState();
}

class _GlobalDropDownState extends State<GlobalDropDown> {
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();
  late int? selectedId;

  @override
  void initState() {
    if (kDebugMode) print("selected id is .. ${widget.sourceId}");
    selectedId = widget.sourceId ?? widget.selectedId;
    selectedId != null && !widget.isUpdateButton
        ? widget.onChanged(selectedId!)
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print("selected id is $selectedId");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionRequiredTitle(
          title: widget.title,
          isRequired: widget.isRequired,
        ),
        DropdownButtonFormField<int>(
          key: _fieldKey,
          validator: (int? value) {
            if (selectedId == null && widget.isRequired) {
              return '${widget.title} is required';
            }
            return null;
          },
          icon: widget.isLoading
              ? SpinKitFadingCircle(
                  color: KColor.softGrey.color,
                  size: 20.0,
                )
              : widget.isError
                  ? InkWell(
                      onTap: () => widget.onErrorTap!(),
                      child: const Row(
                        children: [
                          Text("Reload please"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.replay_circle_filled,
                          ),
                        ],
                      ))
                  : null,
          decoration: buildInputDecoration(
              label: widget.title,
              icon: null,
              isRequired: widget.isRequired,
              isDropdownField: true),
          hint: Text(
            "Select ${widget.title}",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: KColor.softGrey.color,
            ),
          ),
          value: selectedId,
          onChanged: widget.sourceId != null
              ? null
              : (int? newValue) {
                  selectedId = newValue;
                  widget.onChanged(selectedId!);
                  if (widget.isRequired) {
                    final currentState = _fieldKey.currentState;
                    currentState?.validate();
                  }
                  setState(() {});
                },
          items: widget.items.map<DropdownMenuItem<int>>((item) {
            return DropdownMenuItem<int>(
              value: item.id,
              child: Text(
                item.name,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: item.id == selectedId
                      ? KColor.primary.color
                      : KColor.black.color,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class NameId {
  final String name;
  final int id;

  NameId(this.name, this.id);
}

class NameId2 {
  final String titleName;
  final String returnName;
  final int id;

  NameId2(this.id, this.titleName, this.returnName);
}

class GlobalConstantDropDown extends StatefulWidget {
  final String title;
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final double? width;
  final bool isRequired;
  const GlobalConstantDropDown({
    Key? key,
    this.width,
    required this.title,
    required this.onChanged,
    required this.items,
    this.isRequired = true,
    required this.selectedValue,
  }) : super(key: key);

  @override
  State<GlobalConstantDropDown> createState() => _GlobalConstantDropDownState();
}

class _GlobalConstantDropDownState extends State<GlobalConstantDropDown> {
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();
  String? selectedValue;

  @override
  void initState() {
    selectedValue = widget.selectedValue;

    selectedValue != null ? widget.onChanged(selectedValue!) : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print("selected id is $selectedValue");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionRequiredTitle(
          title: widget.title,
          isRequired: widget.isRequired,
        ),
        DropdownButtonFormField<String>(
          key: _fieldKey,
          validator: (value) {
            if (selectedValue == null && widget.isRequired) {
              return '${widget.title} is required';
            }
            return null;
          },
          decoration: buildInputDecoration(
              label: widget.title,
              icon: null,
              isRequired: widget.isRequired,
              isDropdownField: true),
          hint: Text(
            "Select ${widget.title}",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: KColor.softGrey.color,
            ),
          ),
          value: selectedValue,
          onChanged: (newValue) {
            selectedValue = newValue;
            selectedValue != null ? widget.onChanged(selectedValue!) : null;
            if (widget.isRequired) {
              final currentState = _fieldKey.currentState;
              currentState?.validate();
            }
            setState(() {});
          },
          items: widget.items.map<DropdownMenuItem<String>>((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: item == selectedValue
                      ? KColor.primary.color
                      : KColor.black.color,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
