import 'package:flutter/material.dart';
import '../../utils/styles/styles.dart';

class GlobalDropdown extends StatelessWidget {
  const GlobalDropdown({
    Key? key,
    required this.validator,
    required this.hintText,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  final String? Function(Object?)? validator;
  final String? hintText;
  final void Function(Object?)? onChanged;
  final List<DropdownMenuItem<Object>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      menuMaxHeight: 200,
      validator: validator,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Color(0xff9ea1a6),
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: KColor.fill.color,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: KColor.enableBorder.color, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KColor.red.color, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KColor.red.color, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: KColor.divider.color, width: 1),
        ),
      ),
      isExpanded: true,
      hint: Text(
        "$hintText",
        style: TextStyle(
          color: KColor.grey.color,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      onChanged: onChanged,
      items: items,
    );
  }
}
