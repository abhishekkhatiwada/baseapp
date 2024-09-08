import 'package:baseapp/app/theme.dart';
import 'package:baseapp/common/enum/textfield_type.dart';
import 'package:baseapp/common/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  final TextEditingController? controller;
  final int length;
  final void Function(String) onChanged;
  final bool isObscureText;
  final double? fieldHeight;
  final double? fieldWidth;
  final String? Function(String?)? validator;
  final TextFieldType type;
  final MainAxisAlignment mainAxisAlignment;
  const CustomPinCodeField({
    super.key,
    this.controller,
    this.length = 4,
    required this.onChanged,
    this.isObscureText = true,
    this.fieldHeight,
    this.fieldWidth,
    this.validator,
    this.type = TextFieldType.filled,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      obscureText: isObscureText,
      appContext: context,
      length: length,
      blinkWhenObscuring: true,
      blinkDuration: const Duration(milliseconds: 450),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      errorTextMargin: EdgeInsets.only(bottom: 5.hp, top: 5.hp),
      controller: controller,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: fieldHeight ?? 60.wp,
        fieldWidth: fieldWidth ?? 60.wp,
        borderWidth: 1,
        fieldOuterPadding: mainAxisAlignment == MainAxisAlignment.start
            ? EdgeInsets.only(right: 10.wp)
            : EdgeInsets.zero,
        activeColor: CustomTheme.primaryColor,
        activeFillColor: type == TextFieldType.filled
            ? CustomTheme.lightGray
            : Colors.transparent,
        selectedColor: CustomTheme.primaryColor,
        selectedFillColor: type == TextFieldType.filled
            ? CustomTheme.lightGray
            : Colors.transparent,
        inactiveFillColor: type == TextFieldType.filled
            ? CustomTheme.midGrayColor
            : Colors.transparent,
        inactiveColor: type == TextFieldType.filled
            ? CustomTheme.midGrayColor
            : CustomTheme.gray,
      ),
      mainAxisAlignment: mainAxisAlignment,
      animationType: AnimationType.fade,
      enableActiveFill: true,
      autovalidateMode: AutovalidateMode.disabled,
      cursorColor: CustomTheme.primaryColor,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
