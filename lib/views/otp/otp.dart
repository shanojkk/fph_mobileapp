import 'dart:async';

import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/animation_controller_state.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/connectivity_wrapper.dart';
import 'package:family_pro_health/views/shared/error_text.dart';
import 'package:family_pro_health/views/shared/passcode_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends AnimationControllerState<OTP> {
  late TextEditingController otpController;
  late Timer timer;
  late int remainingTime;
  late int timerTime;
  late bool error;
  late String errorMessage;
  late GlobalKey<FormState> _formKey;
  late bool connectionState;

  @override
  void initState() {
    otpController = TextEditingController(text: "");
    remainingTime = 30;
    timerTime = 30;
    error = false;
    connectionState = true;
    errorMessage = "";
    _formKey = GlobalKey();
    initTimer();
    super.initState();
  }

  initTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      remainingTime = timerTime - timer.tick;
      if (remainingTime <= 0) {
        timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
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
                Column(
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
                    const SizedBox(height: 16),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            remainingTime == 0
                                ? GestureDetector(
                                    onTap: () {
                                      // TODO: Resend OTP
                                    },
                                    child: const Text(
                                      "Resend OTP",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        color: AppColors.primaryPallete,
                                        fontSize: 16,
                                        height: 1.25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        letterSpacing: 1,
                                        color: AppColors.neutralVariant10,
                                        height: 1.25,
                                      ),
                                      text: "Resend OTP in ",
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: "${remainingTime}s",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                        ConnectivityWrapper(builder: (connected) {
                          if (connectionState != connected) {
                            if (!connected) {
                              animationController.forward();
                              error = true;
                              errorMessage = Strings.networkConnectionErrorMsg;
                            } else {
                              animationController.reverse();
                              error = false;
                            }
                          }
                          return Form(
                            key: _formKey,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: appSize.height / 15),
                              child: Column(
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(bottom: 16),
                                    child: Text(
                                      "OTP ",
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        color: AppColors.neutralVariant10,
                                        height: 1.25,
                                      ),
                                    ),
                                  ),
                                  PasscodeField(
                                    controller: otpController,
                                    autoDismissKeyboard: true,
                                    onCompleted: (value) {},
                                    validator: (value) {
                                      if (value?.isEmpty == true) {
                                        return "Please enter a valid OTP";
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
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                    ConnectivityWrapper(
                      builder: (connected) => AppButton(
                        onTap: () {
                          if (connected) {
                            _formKey.currentState?.validate();
                            if (otpController.text.isEmpty ||
                                otpController.text.length < 4) {
                              errorMessage = "Please enter a valid OTP";
                              error = true;
                              animationController.forward();
                              setState(() {});
                            } else {
                              error = false;
                              animationController.reverse();
                              setState(() {});

                              // TODO: Hit API and if the response is success then only navigate to choose passcode screen
                              Navigator.of(context).pushNamed(RouteConfig.choosePasscode);
                            }
                          }
                        },
                        text: Strings.submit,
                        backgroundColor: AppColors.tertiary60,
                        caps: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
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
                  ],
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    SystemChannels.platform.invokeMethod<void>(
                      'SystemNavigator.pop',
                      true,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      Strings.exit,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryPallete,
                        fontWeight: FontWeight.w500,
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
