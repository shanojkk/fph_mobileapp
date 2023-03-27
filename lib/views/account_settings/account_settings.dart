import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/settings_list_item.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final profileTabList = [
      {
        "image": Images.profile,
        "name": "Profile Settings",
        "key": "profile",
        "route": RouteConfig.profileSettings,
      },
      {
        "image": Images.calender,
        "name": "Manage Schedule",
        "key": "schedule",
        "route": RouteConfig.manageSchedule,
      },
      {
        "image": Images.box,
        "name": "Manage Thresholds",
        "key": "threshold",
        "route": RouteConfig.manageThreshold,
      },
      {
        "image": Images.customerService,
        "name": "Customer Services",
        "key": "customer",
        "route": RouteConfig.customerService,
      },
      {
        "image": Images.help,
        "name": "Help & FAQs",
        "key": "help",
        "route": RouteConfig.helpFaqs,
      },
    ];
    final appSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: profileTabList.length + 1,
              itemBuilder: (context, index) {
                if (index == profileTabList.length) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: appSize.height / 12,
                      left: 8,
                      right: 8,
                    ),
                    child: SizedBox(
                      width: appSize.width,
                      // height: appSize.height / 16,
                      child: AppButton(
                        key: const Key("logout-button"),
                        onTap: () {},
                        text: "Logout".toUpperCase(),
                        outlined: true,
                        textColor: AppColors.primaryPallete,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                }
                return SettingsListItem(
                  key: Key(profileTabList[index]["key"]!),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: FutureBuilder(
              future: PackageInfo.fromPlatform(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  return Text(
                    key: const Key("version"),
                    "Version ${data?.version}",
                    style: const TextStyle(
                      color: AppColors.primaryPallete,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
