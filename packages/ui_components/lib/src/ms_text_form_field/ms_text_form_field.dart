import 'package:flutter/material.dart';

final class MsTextFormField extends StatelessWidget {
  const MsTextFormField({
    this.controller,
    this.focusNode,
    this.forceErrorText,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.obscureText = false,
    this.enabled = true,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.readOnly = false,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? forceErrorText;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration().copyWith(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: obscureText,
      enabled: enabled,
      focusNode: focusNode,
      forceErrorText: forceErrorText,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      readOnly: readOnly,
    );
  }
}
