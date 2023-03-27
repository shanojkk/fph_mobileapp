import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  /// Navigate to
  ///
  /// [Welcome] :- if opening application for the first time
  ///
  /// [Home] :- if logggedIn
  /// 
  /// [Login] :- if not loggedIn
  ///
  /// after 2 seconds
  void navigateToWelcomeScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Preferences.instance.isFirstTime()
            ? RouteConfig.welcome
            : Preferences.instance.isLogin()
                ? RouteConfig.home
                : RouteConfig.login,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;

    navigateToWelcomeScreen(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    Strings.welcomeTo,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textColorSecondary,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SvgPicture.asset(
                    Images.logo,
                    width: appSize.width / 1.5,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              Images.splash,
              width: appSize.width,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
