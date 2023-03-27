import 'package:family_pro_health/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:family_pro_health/helpers/route_config.dart';

/// Please note than this screen is for development purpose only
/// 
/// In the final application, we will not be navigating to this screen
/// because all the routes will be present in the [RouteConfig] file
class ErrorPage extends StatelessWidget {
  const ErrorPage({required this.routeName, super.key});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "404 Route Not Found",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: const TextStyle(
                      color: AppColors.neutralVariant10,
                      fontSize: 16,
                    ),
                    children: [
                      const TextSpan(text: "Please check if you entry of "),
                      TextSpan(
                        text: routeName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: " in route_config")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
