import 'package:family_pro_health/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({this.onChanged, super.key});
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  late bool value;

  @override
  void initState() {
    value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      side: const BorderSide(
        color: AppColors.textFieldBorderColor,
        width: 2,
      ),
      value: value,
      onChanged: (value) {
        this.value = value ?? false;
        if (widget.onChanged != null) {
          widget.onChanged!(this.value);
        }
        setState(() {});
      },
    );
  }
}
