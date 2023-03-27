import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsListItem extends StatelessWidget {
  const SettingsListItem({
    required this.itemArray,
    this.onTap,
    required this.index,
    super.key,
  });
  final List itemArray;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 16,
      leading: SvgPicture.asset(
        itemArray[index]['image'] ?? "",
        height: 18,
        width: 18,
      ),
      title: Text(
        '${itemArray[index]['name']}',
        style: const TextStyle(
          color: AppColors.neutralVariant40,
          // fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: SvgPicture.asset(
        Images.rightAlignArrow,
        height: 12,
      ),
      onTap: onTap,
    );
  }
}
