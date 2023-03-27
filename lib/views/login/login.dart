import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/animation_controller_state.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/views/shared/connectivity_wrapper.dart';
import 'package:family_pro_health/views/shared/error_text.dart';
import 'package:family_pro_health/views/shared/passcode_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends AnimationControllerState<Login> {
  late TextEditingController _passcodeController;
  late bool error;
  late String errorMessage;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _passcodeController = TextEditingController(text: "");
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
          child: Form(
            key: _formKey,
            child: Container(
              height: appSize.height - MediaQuery.of(context).padding.top,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: appSize.height / 15),
                    child: SvgPicture.asset(
                      Images.logoHorizontal,
                      width: appSize.width * 0.65,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        Strings.welcomeBack,
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
                          height: 1.25,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(height: appSize.height / 15),
                      const Text(
                        Strings.unlockWithPasscode,
                        style: TextStyle(
                          letterSpacing: 1,
                          color: AppColors.neutralVariant40,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ConnectivityWrapper(
                        builder: (connected) {
                          if (!connected) {
                            animationController.forward();
                            error = true;
                            errorMessage =
                                "Your mobile data is turned off, please turn on mobile data.";
                          } else {
                            animationController.reverse();
                            error = false;
                          }
                          return StatefulBuilder(builder: (context, updateState) {
                            return Column(
                              children: <Widget>[
                                PasscodeField(
                                  controller: _passcodeController,
                                  onCompleted: (value) {
                                    _formKey.currentState?.validate();
                                    if (value != Preferences.instance.getPasscode()) {
                                      animationController.forward();
                                      error = true;
                                      errorMessage =
                                          "Invalid passcode, please try again !";
                                    } else {
                                      Preferences.instance.setLogin(true);
                                      animationController.reverse();
                                      error = false;
                                      Navigator.of(context).pushNamedAndRemoveUntil(
                                        RouteConfig.home,
                                        (route) => false,
                                      );
                                    }
                                    if (mounted) {
                                      updateState(() {});
                                    }
                                  },
                                  validator: (value) {
                                    if (value != Preferences.instance.getPasscode()) {
                                      return "Invalid passcode, please try again !";
                                    }
                                    return null;
                                  },
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
                            );
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: appSize.height / 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(RouteConfig.forgotPin);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        Strings.forgotPasscode,
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryPallete,
                          letterSpacing: 1,
                        ),
                      ),
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
      ),
    );
  }
}
