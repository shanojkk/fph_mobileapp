import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/views/edit_profile/country_codes.dart';
import 'package:flutter/material.dart';

class CountryDropDown extends StatefulWidget {
  const CountryDropDown({super.key});

  @override
  State<CountryDropDown> createState() => _CountryDropDownState();
}

class _CountryDropDownState extends State<CountryDropDown> {
  late Map<String, String> selected;

  @override
  void initState() {
    // Defaults to +91 (India)
    selected = {
      "name": "India",
      "code": "IN",
      "dial_code": "+91",
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField(
          alignment: Alignment.center,
          elevation: 0,
          isExpanded: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 13),
            border: OutlineInputBorder(
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
              "${selected['dial_code']}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.neutralVariant10,
              ),
            ),
          ),
          // value: selected,
          items: codes
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Center(
                    child: Text(
                      "${e['dial_code']} ${e['code']}",
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
    );
  }
}
