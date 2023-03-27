import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/animation_controller_state.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/error_text.dart';
import 'package:family_pro_health/views/shared/passcode_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChoosePasscode extends StatefulWidget {
  const ChoosePasscode({super.key});

  @override
  State<ChoosePasscode> createState() => _ChoosePasscodeState();
}

class _ChoosePasscodeState extends AnimationControllerState<ChoosePasscode> {
  late TextEditingController _choosePasscodeController;
  late TextEditingController _confirmPasscodeController;
  late FocusNode _confirmPasscodeFocusNode;
  late bool error;
  late String errorMessage;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _choosePasscodeController = TextEditingController(text: "");
    _confirmPasscodeController = TextEditingController(text: "");
    _confirmPasscodeFocusNode = FocusNode();
    error = false;
    errorMessage = "";
    _formKey = GlobalKey();
    super.initState();
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
                  key: _formKey,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "${Strings.hi},",
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.neutralVariant10,
                              height: 2.5,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            Preferences.instance.getName(),
                            style: const TextStyle(
                              fontSize: 22,
                              color: AppColors.neutralVariant10,
                              height: 1.5,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            Strings.phoneVerified,
                            style: TextStyle(
                              letterSpacing: 1,
                              color: AppColors.neutralVariant40,
                              height: 1.25,
                            ),
                          ),
                          SizedBox(height: appSize.height / 17),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: const <Widget>[
                                  Text(
                                    Strings.choosePasscode,
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: AppColors.neutralVariant10,
                                      height: 1.25,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: PasscodeField(
                                  controller: _choosePasscodeController,
                                  onCompleted: (_) {
                                    FocusScope.of(context)
                                        .requestFocus(_confirmPasscodeFocusNode);
                                  },
                                  validator: (value) {
                                    if (value?.isEmpty == true) {
                                      return "error";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: appSize.height / 25),
                          Column(
                            children: <Widget>[
                              Row(
                                children: const <Widget>[
                                  Text(
                                    Strings.confirmPasscode,
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      color: AppColors.neutralVariant10,
                                      height: 1.25,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: PasscodeField(
                                  controller: _confirmPasscodeController,
                                  focusNode: _confirmPasscodeFocusNode,
                                  autoDismissKeyboard: true,
                                  onCompleted: (value) {},
                                  validator: (value) {
                                    if (value != _choosePasscodeController.text) {
                                      return "error";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              if (error && errorMessage.isNotEmpty)
                                AnimatedBuilder(
                                  animation: translate,
                                  builder: (context, child) => Padding(
                                    padding: EdgeInsets.only(top: translate.value),
                                    child: child,
                                  ),
                                  child: ErrorText(
                                    text: errorMessage,
                                    center: true,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(height: appSize.height / 20),
                          SizedBox(
                            width: double.infinity,
                            child: AppButton(
                              onTap: () {
                                _formKey.currentState?.validate();
                                if (_choosePasscodeController.text.isNotEmpty) {
                                  if (_choosePasscodeController.text.length < 4 ||
                                      _confirmPasscodeController.text.length < 4) {
                                    error = true;
                                    errorMessage =
                                        "Please enter a valid 4 digit passcode";
                                    animationController.forward();
                                    setState(() {});
                                    return;
                                  }
                                  if (_choosePasscodeController.text ==
                                      _confirmPasscodeController.text) {
                                    error = false;
                                    animationController.reverse();

                                    /// Saving passcode in [Shared Preferences]
                                    Preferences.instance
                                        .setPasscode(_choosePasscodeController.text);
                                    Preferences.instance.setFirstTime(false);
                                    Navigator.of(context).pushNamedAndRemoveUntil(
                                      RouteConfig.login,
                                      (_) => false,
                                    );
                                  } else {
                                    animationController.forward();
                                    error = true;
                                    errorMessage = Strings.passcodeMismatch;
                                    setState(() {});
                                  }
                                } else {
                                  error = true;
                                  animationController.forward();
                                  errorMessage =
                                      "Passcode cannot be empty. Please enter 4 digit passcode";
                                  setState(() {});
                                }
                              },
                              text: Strings.continueText,
                              backgroundColor: AppColors.tertiary60,
                              caps: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
