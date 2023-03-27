import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/item_with_multiple_checkbox.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:flutter/material.dart';

class BiometricDataPermission extends StatefulWidget {
  const BiometricDataPermission({super.key});

  @override
  State<BiometricDataPermission> createState() => _BiometricDataPermissionState();
}

class _BiometricDataPermissionState extends State<BiometricDataPermission> {
  final personsList = [
    {"name": "Rahul Gulati"},
    {"name": "Malti Gulati"},
    {"name": "Mukul Agrawal"},
  ];
  List<bool> isChecked = [];

  @override
  void initState() {
    for (int i = 0; i < personsList.length; i++) {
      isChecked.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return PageStructure(
      title: "Biometric Data Permission",
      showBack: true,
      showNotification: false,
      selected: 3,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
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
                child: ListView.builder(
                  itemCount: personsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: ItemWithMultipleCheckbox(
                        title: personsList[index]['name']!,
                        twoCheckbox: false,
                        onChanged2: (value) {
                          isChecked[index] = value!;
                        },
                      ),
                    );
                  },
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
