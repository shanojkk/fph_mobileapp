import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/helpers/no_glow_scroll_behaviour.dart';
import 'package:family_pro_health/views/shared/item_with_multiple_checkbox.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:flutter/material.dart';


class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  List<bool> isChecked1 = [false, false];
  List<bool> isChecked2 = [false, false];

  bool voiceInstructionCheck = false;

  @override
  Widget build(BuildContext context) {
    final notificationList = [
      {"name": "Schedule Reminder"},
      {"name": "Exceeds Thresholds"},
    ];
    final voiceNotificationList = [
      {"name": "Voice Instructions"},
    ];

    final appSize = MediaQuery.of(context).size;
    return PageStructure(
      showBack: true,
      selected: 3,
      title: "Notification Settings",
      showNotification: false,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Whatsapp"),
                  SizedBox(
                    width: appSize.width / 20,
                  ),
                  const Text("Email"),
                  SizedBox(
                    width: appSize.width / 50,
                  ),
                ],
              ),
              Expanded(
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehaviour(),
                  child: ListView.builder(
                    itemCount: notificationList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          children: [
                            ItemWithMultipleCheckbox(
                              onChanged1: (value) {
                                isChecked1[index] = value!;
                              },
                              onChanged2: (value) {
                                isChecked2[index] = value!;
                              },
                              title: notificationList[index]['name']!,
                              twoCheckbox: true,
                            ),
                            if (index != (notificationList.length - 1))
                              const Divider(
                                height: 0,
                                thickness: 1,
                                color: AppColors.dividerColorPrimary,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Yes"),
                  SizedBox(
                    width: appSize.width / 30,
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: ScrollConfiguration(
                  behavior: NoGlowScrollBehaviour(),
                  child: ListView.builder(
                    itemCount: voiceNotificationList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Column(
                          children: [
                            ItemWithMultipleCheckbox(
                              onChanged2: (value) {
                                voiceInstructionCheck = value!;
                              },
                              title: voiceNotificationList[index]['name']!,
                              twoCheckbox: false,
                            ),
                            if (index != (voiceNotificationList.length - 1))
                              const Divider(
                                height: 0,
                                thickness: 1,
                                color: AppColors.dividerColorPrimary,
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: appSize.width,
                child: AppButton(
                  key: const Key("save"),
                  onTap: () {},
                  text: "Save".toUpperCase(),
                  backgroundColor: AppColors.tertiary60,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
