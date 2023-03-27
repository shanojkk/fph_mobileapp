import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/helpers/animation_controller_state.dart';
import 'package:flutter/material.dart';

class CommonDropdown extends StatefulWidget {
  const CommonDropdown({
    required this.itemArray,
    required this.label,
    required this.hint,
    this.labelSize = 20,
    this.validator,
    super.key,
  });

  final List<Map<String, String>> itemArray;
  final String label;
  final String hint;
  final double? labelSize;
  final FormFieldValidator<Map<String, String>>? validator;

  @override
  State<CommonDropdown> createState() => _CommonDropdownState();
}

class _CommonDropdownState extends AnimationControllerState<CommonDropdown> {
  late Map<String, String> selected;
  late FocusNode _focusNode;
  late bool _hasFocus;
  late bool _hasError;
  String? error;

  @override
  void initState() {
    _hasFocus = false;
    _hasError = false;
    selected = {"name": "Select", "value": ""};
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
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            menuMaxHeight: 200,
            alignment: Alignment.center,
            elevation: 0,
            // isExpanded: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: _focusNode,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              label: Text(widget.label),
              labelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: _hasError
                    ? AppColors.error40
                    : _hasFocus
                        ? AppColors.primaryPallete
                        : AppColors.neutralVariant10,
                fontSize: widget.labelSize,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.textFieldBorderColor,
                ),
              ),
            ),
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
            ),
            hint: Center(
              child: Text(
                "${selected['name']}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.neutralVariant10,
                ),
              ),
            ),
            validator: (value) {
              if (widget.validator != null) {
                error = widget.validator!(value);
                print(error);
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
            items: widget.itemArray
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Center(
                      child: Text(
                        "${e['name']}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.neutralVariant10,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              selected = value ?? {};
              setState(() {});
            },
          ),
        ),
        if (_hasError && error?.isNotEmpty == true)
          AnimatedBuilder(
            animation: translate,
            builder: (context, child) => Padding(
              padding: EdgeInsets.only(top: translate.value, left: 4),
              child: child!,
            ),
            child: Text(
              error ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: AppColors.error40),
            ),
          )
      ],
    );
  }
}
