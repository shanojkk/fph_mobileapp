import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/views/shared/custom_checkbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWithMultipleCheckbox extends StatelessWidget {
  const ItemWithMultipleCheckbox({
    required this.title,
    required this.twoCheckbox,
    this.onChanged1,
    this.onChanged2,
    super.key,
  });

  final String title;
  final bool twoCheckbox;
  final ValueChanged<bool?>? onChanged1;
  final ValueChanged<bool?>? onChanged2;
  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            color: AppColors.neutralVariant10,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Visibility(
                visible: twoCheckbox,
                child: CustomCheckbox(onChanged: onChanged1),
              ),
              SizedBox(
                width: appSize.width / 20,
              ),
              CustomCheckbox(onChanged: onChanged2),
            ],
          ),
        ),
      ],
    );
  }
}
