import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/helpers/extension.dart';
import 'package:family_pro_health/helpers/validator.dart';
import 'package:family_pro_health/views/edit_profile/country_dropdown.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/app_text_form_field.dart';
import 'package:family_pro_health/views/shared/common_dropdown.dart';
import 'package:family_pro_health/views/shared/gender_radio_buttons.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController name = TextEditingController(text: "");
  late TextEditingController address = TextEditingController(text: "");
  late TextEditingController locality = TextEditingController(text: "");
  late TextEditingController city = TextEditingController(text: "");
  late TextEditingController postalCode = TextEditingController(text: "");
  late TextEditingController mobile = TextEditingController(text: "");
  late TextEditingController email = TextEditingController(text: "");
  late TextEditingController dob = TextEditingController(text: "");
  late TextEditingController height = TextEditingController(text: "");
  late String dateText = '';
  late String radioValue = "Male";
  late String? gender = "";
  late bool checkGender = false;

  final _formKey = GlobalKey<FormState>();

  void validateGender() {
    checkGender = gender?.isEmpty == true;
    print(checkGender);
    setState(() {});
  }

  List<Map<String, String>> feetArray = [
    {"name": "1", "value": "1"},
    {"name": "2", "value": "2"},
    {"name": "3", "value": "3"},
    {"name": "4", "value": "4"},
    {"name": "5", "value": "5"},
    {"name": "6", "value": "6"},
    {"name": "7", "value": "7"},
    {"name": "8", "value": "8"},
    {"name": "9", "value": "9"},
  ];

  List<Map<String, String>> inchesArray = [
    {"name": "0", "value": "0"},
    {"name": "1", "value": "1"},
    {"name": "2", "value": "2"},
    {"name": "3", "value": "3"},
    {"name": "4", "value": "4"},
    {"name": "5", "value": "5"},
    {"name": "6", "value": "6"},
    {"name": "7", "value": "7"},
    {"name": "8", "value": "8"},
    {"name": "9", "value": "9"},
    {"name": "10", "value": "10"},
    {"name": "11", "value": "11"},
  ];

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return PageStructure(
      title: "Edit Profile",
      showBack: true,
      selected: 3,
      child: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        AppTextFormField(
                          key: const Key("name"),
                          validator: (value) => Validator.isRequired(value, "Name"),
                          controller: name,
                          label: "Name",
                          hint: "Enter Name",
                        ),
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        AppTextFormField(
                          key: const Key("address"),
                          validator: (value) => Validator.isRequired(value, "Address"),
                          controller: address,
                          label: "Address",
                          hint: "Enter Address",
                        ),
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        AppTextFormField(
                          key: const Key("locality"),
                          validator: (value) => Validator.isRequired(value, "Locality"),
                          controller: locality,
                          label: "Locality",
                          hint: "Enter Locality",
                        ),
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: AppTextFormField(
                                key: const Key("city"),
                                validator: (value) => Validator.isRequired(value, "City"),
                                controller: city,
                                label: "Town/City",
                                hint: "Enter City",
                              ),
                            ),
                            SizedBox(
                              width: appSize.width / 50,
                            ),
                            Flexible(
                              flex: 1,
                              child: AppTextFormField(
                                key: const Key("postalCode"),
                                validator: (value) =>
                                    Validator.isRequired(value, "Postal Code"),
                                keyboardType: TextInputType.number,
                                digitsOnly: true,
                                controller: postalCode,
                                label: "Postal Code",
                                hint: "Enter Postal Code",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CountryDropDown(),
                            SizedBox(
                              width: appSize.width / 40,
                            ),
                            Expanded(
                              child: AppTextFormField(
                                // autovalidateMode: AutovalidateMode.onUserInteraction,
                                key: const Key("mobileNumber"),
                                isPhone: true,
                                validator: Validator.mobileNumberValidator,
                                keyboardType: TextInputType.number,
                                digitsOnly: true,
                                controller: mobile,
                                label: "Mobile Number",
                                hint: "Enter 10 digit Mobile Number",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        AppTextFormField(
                          key: const Key("emailAddress"),
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.emailIdValidator,
                          controller: email,
                          label: "Email Address",
                          hint: "Enter Email Address",
                        ),
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        StatefulBuilder(
                          builder: (context, updateState) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Gender",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                GenderRadioButtons(
                                  onChanged: ((value) {
                                    gender = value;
                                    updateState(() {
                                      checkGender = false;
                                    });
                                  }),
                                ),
                                checkGender
                                    ? const Text(
                                        "Gender is Required",
                                        style: TextStyle(
                                            fontSize: 14, color: AppColors.error40),
                                      )
                                    : const SizedBox(),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        AppTextFormField(
                          validator: (value) =>
                              Validator.isRequired(value, "Date of birth"),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2100));
                            if (pickedDate != null) {
                              String formattedDate = pickedDate.convertToDate();
                              //formatted date output using intl package =>  2021-03-16
                              setState(() {
                                dob.text = formattedDate;
                              });
                            } else {}
                          },
                          readOnly: true,
                          controller: dob,
                          label: "Date of Birth",
                          hint: "Enter Date of Birth",
                        ),
                        SizedBox(
                          height: appSize.height / 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Height",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: appSize.height / 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CommonDropdown(
                                    itemArray: feetArray,
                                    label: "Feet",
                                    hint: "enter feet",
                                    validator: (value) {
                                      if (value == null ||
                                          value['value']?.isEmpty == true) {
                                        return "Feet is Required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: appSize.width / 40,
                                ),
                                Expanded(
                                  child: CommonDropdown(
                                    itemArray: inchesArray,
                                    label: "Inches",
                                    hint: "Enter Inches",
                                    validator: (value) {
                                      if (value == null ||
                                          value['value']?.isEmpty == true) {
                                        return "Inches is required";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(appSize.height / 50),
                child: SizedBox(
                  width: appSize.width,
                  child: AppButton(
                    key: const Key("save"),
                    onTap: () {
                      validateGender();
                      if (_formKey.currentState!.validate()) {}
                    },
                    text: "Save".toUpperCase(),
                    backgroundColor: AppColors.tertiary60,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
