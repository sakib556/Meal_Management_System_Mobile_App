import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_management/utils/styles/k_colors.dart';

class CustomTextField extends StatefulWidget {
  final bool isPasswordField;
  final TextEditingController controller;
  final String title;

  const CustomTextField({
    super.key,
    required this.isPasswordField,
    required this.controller,
    required this.title,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController controller;
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    controller = widget.controller;
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  void validateField(String value) {
    final currentState = _fieldKey.currentState;
    currentState?.validate();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      key: _fieldKey,
      controller: controller,
      obscureText: widget.isPasswordField && _isObscure,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: KColor.primary.color),
        ),
        labelText: widget.title,
        labelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: KColor.grey.color),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: KColor.grey.color,
                ),
              )
            : null,
      ),
      keyboardType: widget.isPasswordField
          ? TextInputType.visiblePassword
          : TextInputType.name,
      onChanged: (value) {
        validateField(value);
      },
      cursorColor: KColor.primary.color,
      showCursor: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${widget.title} is required';
        }
        return null;
      },
    );
  }
}

class DoubleTextFieldRow extends StatelessWidget {
  final Widget firstField;
  final Widget secondField;
  final double? width;

  const DoubleTextFieldRow({
    Key? key,
    required this.firstField,
    required this.secondField,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: firstField),
        SizedBox(
          width: width ?? 5,
        ),
        Expanded(child: secondField),
      ],
    );
  }
}

class BorderedTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextEditingController controller;
  final bool isRequired;
  final bool isPasword;
  final Function(String?) onChanged;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final GlobalKey<FormState>? formKey;
  final int? maxLines;
  final String? validationLabel;
  const BorderedTextField({
    Key? key,
    this.validationLabel,
    this.prefixIcon,
    required this.label,
    required this.controller,
    this.isRequired = true,
    this.keyboardType = TextInputType.name,
    this.isPasword = false,
    this.formKey,
    this.maxLines,
    required this.onChanged,
    this.hint,
  }) : super(key: key);

  @override
  State<BorderedTextField> createState() => _BorderedTextFieldState();
}

class _BorderedTextFieldState extends State<BorderedTextField> {
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController controller;
  final GlobalKey<FormFieldState> _fieldKey = GlobalKey<FormFieldState>();
  bool isObsecure = true;
  @override
  void initState() {
    controller = widget.controller;
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  void validateField(String value) {
    widget.onChanged(value);
    if (widget.isRequired) {
      final currentState = _fieldKey.currentState;
      currentState?.validate();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _fieldKey,
      obscureText: widget.isPasword ? isObsecure : false,
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
      focusNode: _focusNode,
      controller: controller,
      maxLines: widget.maxLines ?? 1,
      keyboardType: widget.keyboardType,
      decoration: buildInputDecoration(
          label: widget.label,
          icon: widget.prefixIcon,
          isPassword: widget.isPasword,
          isObsecure: isObsecure,
          hint: widget.hint,
          isRequired: widget.isRequired,
          onVisiblePressed: () {
            setState(() {
              isObsecure = !isObsecure;
            });
          }),
      cursorColor: KColor.primary.color,
      validator: (value) {
        if (!widget.isRequired) return null;
        if (value == null || value.isEmpty) {
          return '${widget.validationLabel ?? widget.label} is required';
        } else if (!_focusNode.hasFocus &&
            widget.keyboardType == TextInputType.number) {
          if (double.tryParse(value) == null) {
            return '${widget.label} must be a valid number';
          }
        } else if (!_focusNode.hasFocus &&
            widget.keyboardType == TextInputType.phone) {
          return !RegExp(r'^[0-9]*$').hasMatch(value)
              ? 'Invalid phone number'
              : null;
        } else if (!_focusNode.hasFocus &&
            widget.keyboardType == TextInputType.emailAddress) {
          return !value.contains('@') ? 'Invalid email format' : null;
        }
        return null;
      },
      onChanged: (value) {
        validateField(value);
      },
    );
  }
}

class BorderedDescriptionField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final int maxLines;
  final Function(String?)? onChanged;

  const BorderedDescriptionField({
    Key? key,
    required this.controller,
    required this.label,
    this.maxLines = 3,
    this.onChanged,
  }) : super(key: key);

  @override
  State<BorderedDescriptionField> createState() =>
      _BorderedDescriptionFieldState();
}

class _BorderedDescriptionFieldState extends State<BorderedDescriptionField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
        TextField(
          controller: widget.controller,
          maxLines: widget.maxLines,
          onChanged: widget.onChanged,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: KColor.grey.color.withOpacity(.50),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: KColor.grey.color.withOpacity(.50),
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: KColor.primary.color),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: KColor.primary.color),
            ),
            hoverColor: KColor.primary.color,
          ),
          cursorColor: KColor.primary.color,
        ),
      ],
    );
  }
}

InputDecoration buildInputDecoration(
    {String? hint,
    required String label,
    required IconData? icon,
    required bool isRequired,
    bool isObsecure = false,
    bool isDateField = false,
    bool isPassword = false,
    bool isDropdownField = false,
    double? horizontalPadding,
    void Function()? onVisiblePressed}) {
  return InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(
          vertical: 10, horizontal: horizontalPadding ?? 10),
      suffixIcon: icon != null && (isDateField || isPassword)
          ? isPassword
              ? IconButton(
                  onPressed: () {
                    onVisiblePressed!();
                  },
                  icon: Icon(
                      color: KColor.grey.color,
                      isObsecure ? Icons.visibility_off : Icons.visibility))
              : Icon(
                  icon,
                  color: KColor.grey.color,
                )
          : null,
      prefixIcon: icon != null && !isDateField
          ? Icon(
              icon,
              color: KColor.grey.color,
            )
          : null,
      hintStyle: TextStyle(color: KColor.grey.color.withOpacity(.5)),
      label: label.isEmpty || isDateField || isDropdownField
          ? null
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isRequired && label.isNotEmpty ? '*' : '',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.red),
                ),
                Text(
                  label,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: KColor.grey.color),
                )
              ],
            ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: KColor.grey.color.withOpacity(.50)),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: BorderSide(color: KColor.primary.color),
      ),
      errorStyle: const TextStyle(color: Colors.red),
      hoverColor: KColor.primary.color);
}
