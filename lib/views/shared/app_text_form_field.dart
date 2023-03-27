import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/helpers/animation_controller_state.dart';
import 'package:family_pro_health/views/shared/error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    required this.controller,
    required this.label,
    required this.hint,
    this.digitsOnly = false,
    this.keyboardType = TextInputType.text,
    this.verticalContentPadding,
    this.validator,
    this.labelSize = 20,
    this.isPhone = false,
    this.onTap,
    this.readOnly,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final double? verticalContentPadding;
  final double? labelSize;
  final String hint;
  final bool digitsOnly;
  final bool isPhone;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final bool? readOnly;
  final AutovalidateMode? autovalidateMode;
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends AnimationControllerState<AppTextFormField> {
  late FocusNode _focusNode;
  late bool _hasFocus;
  late bool _hasError;
  String? error;

  @override
  void initState() {
    _hasFocus = false;
    _hasError = false;
    _focusNode = FocusNode()..addListener(focusListener);
    super.initState();
  }

  void focusListener() {
    _hasFocus = _focusNode.hasFocus;
    setState(() {});
  }

  @override
  void dispose() {
    _focusNode.removeListener(focusListener);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          autovalidateMode: widget.autovalidateMode,
          onTap: widget.onTap,
          readOnly: widget.readOnly ?? false,
          focusNode: _focusNode,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          inputFormatters: <TextInputFormatter>[
            if (widget.digitsOnly) FilteringTextInputFormatter.digitsOnly,
            if (widget.isPhone) LengthLimitingTextInputFormatter(10),
          ],
          style: const TextStyle(color: AppColors.neutralVariant10),
          validator: (value) {
            if (widget.validator != null) {
              error = widget.validator!(value);
              if (error != null) {
                _hasError = true;
                animationController.forward();
              } else {
                _hasError = false;
                animationController.reverse();
              }
              WidgetsBinding.instance.addPostFrameCallback((timestamp) {
                setState(() {});
              });
            }
            return error?.isNotEmpty == true ? "" : null;
          },
          onTapOutside: (event) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: widget.verticalContentPadding ?? 16,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryPallete,
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.error40,
              ),
            ),
            hintText: widget.hint,
            label: Text(widget.label),
            hintStyle: TextStyle(
              color: _hasError ? AppColors.error60 : AppColors.neutralVariant60,
            ),
            focusColor: AppColors.primaryPallete,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: _hasError
                  ? AppColors.error40
                  : _hasFocus
                      ? AppColors.primaryPallete
                      : AppColors.neutralVariant10,
              fontSize: widget.labelSize,
            ),
            errorMaxLines: 2,
            errorText: null,
            errorStyle: const TextStyle(height: 0),
          ),
        ),
        if (_hasError && error?.isNotEmpty == true)
          AnimatedBuilder(
            animation: translate,
            builder: (context, child) => Padding(
              padding: EdgeInsets.only(top: translate.value, left: 4),
              child: child!,
            ),
            child: ErrorText(
              text: error,
            ),
          )
      ],
    );
  }
}
