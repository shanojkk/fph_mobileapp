import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/views/account_settings/account_settings.dart';
import 'package:family_pro_health/views/home/home.dart';
import 'package:family_pro_health/views/shared/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This widget will be handling bottom navigation bar
class PageStructure extends StatefulWidget {
  const PageStructure({
    this.selected = 0,
    this.backGroundColor = AppColors.neutralVariant95,
    this.showSelected = true,
    this.title,
    this.child,
    this.showBack = false,
    this.showNotification = true,
    super.key,
  });

  final Widget? child;
  final int selected;
  final bool showSelected;
  final String? title;
  final bool showBack;
  final bool showNotification;
  final Color? backGroundColor;

  @override
  State<PageStructure> createState() => _PageStructureState();
}

class _PageStructureState extends State<PageStructure> {
  late int currentIndex;

  late List<Widget> widgets;

  @override
  void initState() {
    currentIndex = widget.selected;
    widgets = <Widget>[
      const Home(),
      const Center(
        child: Text("View Schedule"),
      ),
      const Center(
        child: Text("Report"),
      ),
      const AccountSettings(),
    ];
    if (widget.child != null) {
      widgets[currentIndex] = widget.child!;
    }
    super.initState();
  }

  Widget getWidget(int index) {
    return widgets[index];
  }

  String getTitle() {
    switch (currentIndex) {
      case 0:
        return "Hi, ${Preferences.instance.getName()}";
      case 1:
        return "View Schedule";
      case 2:
        return "Reports";
      case 3:
        return "Account Settings";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CommonAppBar(
          capsTitle: currentIndex != 0,
          title: widget.title ?? getTitle(),
          automaticallyImplyLeading: widget.showBack,
          showNotification: widget.showNotification,
        ),
        // backgroundColor: AppColors.neutralVariant95,
        backgroundColor: widget.backGroundColor,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: AppColors.tertiary80,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: AppColors.neutralVariant50,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            iconSize: 28,
            selectedItemColor: widget.showSelected
                ? AppColors.primaryPallete
                : AppColors.neutralVariant50,
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              // getPage(value);
              setState(() {});
            },
            items: <BottomNavigationBarItem>[
              bottomBarItem(Images.home, "Home", 0),
              bottomBarItem(Images.viewSchedule, "View Schedule", 1),
              bottomBarItem(Images.report, "Report", 2),
              bottomBarItem(Images.profile, "Profile", 3),
            ],
          ),
        ),
        body: getWidget(currentIndex),
      ),
    );
  }

  BottomNavigationBarItem bottomBarItem(
    String image,
    String label,
    int index,
  ) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SvgPicture.asset(
            image,
            height: 24,
            width: 24,
            // ignore: deprecated_member_use
            color: index == currentIndex
                ? AppColors.primaryPallete
                : AppColors.neutralVariant50,
          ),
        ),
        label: label,
      );
}
