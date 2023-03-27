import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:family_pro_health/views/shared/settings_list_item.dart';
import 'package:flutter/material.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final profileTabList = [
      {"image": Images.edit, "name": "Edit Profile", "route": RouteConfig.editProfile},
      {
        "image": Images.notificationSettings,
        "name": "Notification Settings",
        "route": RouteConfig.notificationSettings
      },
      {
        "image": Images.termsOfUse,
        "name": "Terms of Use",
        "route": RouteConfig.termOfUse
      },
      {
        "image": Images.dataPrivacyPolicy,
        "name": "Data Privacy Policy",
        "route": RouteConfig.dataPrivacyPolicy
      },
      {
        "image": Images.biometricDataPermission,
        "name": "Biometric Data Permission",
        "route": RouteConfig.biometricDataPermission
      },
    ];
    final appSize = MediaQuery.of(context).size;

    return PageStructure(
      title: "Profile Settings",
      showBack: true,
      selected: 3,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(appSize.height / 100),
                itemCount: profileTabList.length,
                itemBuilder: (context, index) {
                  return SettingsListItem(
                    itemArray: profileTabList,
                    index: index,
                    onTap: () => Navigator.pushNamed(
                      context,
                      profileTabList[index]["route"]!,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: appSize.width - (appSize.width - 15),
                    endIndent: appSize.width - (appSize.width - 15),
                    height: 0,
                    thickness: 1,
                    color: AppColors.dividerColorSecondary,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
