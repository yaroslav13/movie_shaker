import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

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
    this.onFieldSubmitted,
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
    this.fillColor,
    this.contentPadding,
    this.border,
    this.disabledBorder,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    super.key,
  });

  factory MsTextFormField.relaxed({
    TextEditingController? controller,
    FocusNode? focusNode,
    String? forceErrorText,
    String? hintText,
    String? labelText,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onFieldSubmitted,
    ValueChanged<String?>? onSaved,
    Widget? prefixIcon,
    Widget? suffixIcon,
    int? maxLines,
    int? minLines,
    bool obscureText = false,
    bool enabled = true,
    bool autocorrect = true,
    bool enableSuggestions = true,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction textInputAction = TextInputAction.done,
    bool readOnly = false,
    Color? fillColor,
  }) {
    return MsTextFormField(
      controller: controller,
      focusNode: focusNode,
      forceErrorText: forceErrorText,
      hintText: hintText,
      labelText: labelText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: obscureText,
      enabled: enabled,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      readOnly: readOnly,
      fillColor: fillColor,
      contentPadding: MsEdgeInsets.textFieldPaddingRelaxed,
    );
  }

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? forceErrorText;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
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
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<MsInputDecorationTheme>();
    final filled = theme?.filled ?? true;
    final fillColor = this.fillColor ?? theme?.fillColor;
    final contentPadding = this.contentPadding ?? theme?.contentPadding;
    final border = this.border ?? theme?.border;
    final disabledBorder = this.disabledBorder ?? theme?.disabledBorder;
    final enabledBorder = this.enabledBorder ?? theme?.enabledBorder;
    final focusedBorder = this.focusedBorder ?? theme?.focusedBorder;
    final errorBorder = this.errorBorder ?? theme?.errorBorder;
    final focusedErrorBorder =
        this.focusedErrorBorder ?? theme?.focusedErrorBorder;
    final hintStyle = this.hintStyle ?? theme?.hintStyle;
    final labelStyle = this.labelStyle ?? theme?.labelStyle;
    final errorStyle = this.errorStyle ?? theme?.errorStyle;

    return TextFormField(
      controller: controller,
      decoration: const InputDecoration().copyWith(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: filled,
        fillColor: fillColor,
        contentPadding: contentPadding,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        disabledBorder: disabledBorder,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        errorStyle: errorStyle,
      ),
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
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
