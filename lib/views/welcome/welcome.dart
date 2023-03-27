import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/helpers/validator.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/app_text_form_field.dart';
import 'package:family_pro_health/views/shared/connectivity_wrapper.dart';
import 'package:family_pro_health/views/welcome/components/country_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late TextEditingController _phoneController;
  late GlobalKey<FormState> _formKey;
  late bool submit;
  late bool connected;

  @override
  void initState() {
    submit = false;
    connected = true;
    _phoneController = TextEditingController(text: "");
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: appSize.height - MediaQuery.of(context).padding.top,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appSize.height / 20),
                  child: SvgPicture.asset(
                    Images.logoHorizontal,
                    width: appSize.width * 0.65,
                    fit: BoxFit.cover,
                  ),
                ),
                Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "${Strings.hi}, ",
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.neutralVariant10,
                          height: 2.5,
                          letterSpacing: 1,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: "${Strings.welcomeTo} ",
                          style: TextStyle(
                            fontSize: 22,
                            color: AppColors.neutralVariant10,
                            letterSpacing: 1,
                            height: 1.5,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: Strings.family,
                              style: TextStyle(
                                color: AppColors.primary30,
                              ),
                            ),
                            TextSpan(
                              text: Strings.prohealth,
                              style: TextStyle(
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        Strings.verifyPhoneWelcomeText,
                        style: TextStyle(
                          letterSpacing: 1,
                          color: AppColors.neutralVariant40,
                          height: 1.25,
                        ),
                      ),
                      ConnectivityWrapper(builder: (connected) {
                        if (this.connected != connected) {
                          this.connected = connected;
                          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                            _formKey.currentState?.validate();
                          });
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: appSize.height / 10,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                                child: CountryDropDown(),
                              ),
                              Expanded(
                                child: AppTextFormField(
                                  controller: _phoneController,
                                  label: Strings.mobileNumber,
                                  hint: Strings.mobileNumberHint,
                                  digitsOnly: true,
                                  isPhone: true,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (!connected) {
                                      return Strings.networkConnectionErrorMsg;
                                    }
                                    return Validator.mobileNumberValidator(value);
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      ConnectivityWrapper(builder: (connected) {
                        return SizedBox(
                          width: double.infinity,
                          child: AppButton(
                            onTap: () {
                              if (connected) {
                                if (_formKey.currentState?.validate() == true) {
                                  // TODO: Only hit API if connected to network

                                  Navigator.of(context).pushNamed(RouteConfig.otp);
                                }
                              }
                            },
                            text: Strings.submit,
                            backgroundColor: AppColors.tertiary60,
                            caps: true,
                          ),
                        );
                      }),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigate to terms and condition screem
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: RichText(
                            text: const TextSpan(
                              text: "By clicking on submit, I agree to the ",
                              style: TextStyle(
                                color: AppColors.neutralVariant40,
                                letterSpacing: 0.2,
                                height: 1.2,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: Strings.termsAndCondition,
                                  style: TextStyle(
                                    color: AppColors.primaryPallete,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    SystemChannels.platform
                        .invokeMethod<void>('SystemNavigator.pop', true);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      Strings.exit,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryPallete,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
