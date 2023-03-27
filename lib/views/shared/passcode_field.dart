import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/views/shared/pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PasscodeField extends StatefulWidget {
  const PasscodeField({
    required this.controller,
    this.onCompleted,
    this.focusNode,
    this.validator,
    this.autoDismissKeyboard = false,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onCompleted;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;
  final bool autoDismissKeyboard;

  @override
  State<PasscodeField> createState() => _PasscodeFieldState();
}

class _PasscodeFieldState extends State<PasscodeField> {
  late bool error;

  @override
  void initState() {
    error = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: appSize.width * 0.65,
      child: PinCodeTextField(
        keyboardType: TextInputType.number,
        obscureText: true,
        obscuringCharacter: '*',
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        controller: widget.controller,
        autoDismissKeyboard: widget.autoDismissKeyboard,
        autoFocus: true,
        animationDuration: Duration.zero,
        textStyle:
            TextStyle(color: error ? AppColors.error40 : AppColors.neutralVariant10),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          activeColor: error ? AppColors.error40 : AppColors.neutralVariant60,
          inactiveColor: error ? AppColors.error40 : AppColors.neutralVariant60,
          selectedColor: error ? AppColors.error40 : AppColors.primaryPallete,
          errorBorderColor: AppColors.error40,
          fieldOuterPadding: EdgeInsets.zero,
          borderWidth: error ? 2 : 1,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          fieldHeight: 48,
          fieldWidth: 48,
        ),
        appContext: context,
        length: 4,
        autovalidateMode: AutovalidateMode.disabled,
        validator: (value) {
          if (widget.validator != null) {
            error = widget.validator!(value)?.isNotEmpty ?? false;
            WidgetsBinding.instance.addPostFrameCallback((timestamp) {
              if (mounted) {
                setState(() {});
              }
            });
          }
          return null;
        },
        errorTextSpace: 0,
        focusNode: widget.focusNode,
        onCompleted: (value) {
          // This is to focus on next passcode field, if available
          if (widget.onCompleted != null) {
            widget.onCompleted!(value);
          }
        },
      ),
    );
  }
}
