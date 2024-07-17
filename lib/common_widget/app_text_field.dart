import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../config/colors.dart';
import '../config/constants.dart';
import '../config/fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.labelColor = AppColors.kGray,
      this.textColor,
      this.isObscureText = false,
      this.textCapitalization = TextCapitalization.words,
      required this.textController,
      this.inputFormatter,
      this.keyBoardType = TextInputType.text,
      this.maxLength = 40,
      this.isEnabled = true,
      this.labelText = '',
      this.onChanged,
      this.onFieldSubmitted,
      this.onSaved,
      this.errorText,
      this.suffixIcon = const SizedBox(
        height: 0,
        width: 0,
      ),
      this.onValidate,
      this.focusNode,
      this.readOnly = false});

  final Color labelColor;
  final Color? textColor;
  final bool isObscureText;
  final TextCapitalization textCapitalization;
  final TextEditingController textController;
  final TextInputFormatter? inputFormatter;
  final TextInputType keyBoardType;
  final int maxLength;
  final bool isEnabled;
  final Widget suffixIcon;
  final String labelText;
  final ValueChanged? onChanged;
  final ValueChanged? onFieldSubmitted;
  final ValueChanged? onSaved;
  final String? errorText;
  final String? Function(String?)? onValidate;
  final FocusNode? focusNode;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      autofocus: true,
      onSaved: onSaved,
      focusNode: focusNode,
      keyboardType: keyBoardType,
      obscureText: isObscureText,
      textCapitalization: textCapitalization,
      controller: textController,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      validator: onValidate,
      enabled: isEnabled,
      inputFormatters: inputFormatter != null ? [inputFormatter!] : [],
      onTapOutside: (event) {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      style: AppFonts.styleWithGilroyRegularText(
          fSize: FontSizeValue.fontSize16, color: textColor ?? Theme.of(context).colorScheme.onBackground),
      decoration: InputDecoration(
        filled: true,
          suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 40
          ),
          suffixIcon: suffixIcon,
        fillColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
          counterText: '',

          errorText: errorText,
          errorStyle: AppFonts.styleWithGilroyMediumText(
              color: AppColors.kRed, fSize: FontSizeValue.fontSize14),
          hintText: labelText,
          labelStyle: AppFonts.styleWithGilroyMediumText(
              color: Theme.of(context).colorScheme.onBackground,
              fSize: FontSizeValue.fontSize16),
          hintStyle: TextStyle(color: labelColor),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:  BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:  BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),)),
          enabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),),
              borderRadius: BorderRadius.circular(14)),
          disabledBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),),
              borderRadius: BorderRadius.circular(14)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide:  BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),)),
          border: OutlineInputBorder(
              borderSide:  BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),),
              borderRadius: BorderRadius.circular(14))),
    );
  }
}
