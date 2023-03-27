import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/views/shared/connectivity_wrapper.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSize {
  const CommonAppBar({
    this.automaticallyImplyLeading = false,
    required this.title,
    this.showNotification = true,
    this.capsTitle = true,
    super.key,
  });

  final String title;
  final bool automaticallyImplyLeading;
  final bool showNotification;
  final bool capsTitle;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Widget get child => Builder(builder: (context) {
        return AppBar(
          toolbarHeight: kToolbarHeight + 8,
          backgroundColor: AppColors.primaryPallete,
          leadingWidth: 32,
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontSize: 18,
              ),
          actionsIconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          automaticallyImplyLeading: automaticallyImplyLeading,
          title: Text(capsTitle ? title.toUpperCase() : title),
          actions: <Widget>[
            ConnectivityWrapper(
              builder: (connected) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(connected ? Icons.cloud_done : Icons.cloud_outlined),
                );
              },
            ),
            if (showNotification)
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.notifications_outlined),
                ),
              ),
          ],
        );
      });

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight + 8);
}
