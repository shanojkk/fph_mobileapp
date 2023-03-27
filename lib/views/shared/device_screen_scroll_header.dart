import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/models/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class DeviceScreenScrollHeader extends StatefulWidget {
  const DeviceScreenScrollHeader({super.key});
  @override
  State<DeviceScreenScrollHeader> createState() => _DeviceScreenScrollHeaderState();
}

class _DeviceScreenScrollHeaderState extends State<DeviceScreenScrollHeader> {
  late String selected = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return Consumer<HomeViewModel>(builder: (context, viewModel, child) {
      selected = viewModel.biometricType;
      return Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.primaryPalleteDark,
        width: appSize.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              item(Strings.bloodPressure, Images.bp, selected == Strings.bloodPressure),
              // item(Strings.temperature, Images.temperature,
              //     selected == Strings.temperature),
              item(Strings.pulseOxymeter, Images.pulseOxy,
                  selected == Strings.pulseOxymeter),
              // item(Strings.glucose, Images.glucose, selected == Strings.glucose),
              item(Strings.weight, Images.weight, selected == Strings.weight),
              // item(Strings.lungCapacity, Images.lungCapacity,
              //     selected == Strings.lungCapacity),
            ],
          ),
        ),
      );
    });
  }

  Widget item(String title, String image, bool isSelected) => GestureDetector(
        onTap: () {
          selected = title;
          final homeViewModel = Provider.of<HomeViewModel>(
            context,
            listen: false,
          )..navigateTo(selected);
          homeViewModel.updateImageAndTitle(image, title);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(100),
            ),
            border: Border.all(width: 1, color: Colors.white),
            color: isSelected ? Colors.white : Colors.transparent,
          ),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SvgPicture.asset(
                  image,
                  height: 28,
                  color: isSelected ? AppColors.primaryPallete : Colors.white,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? AppColors.primaryPallete : Colors.white,
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      );
}
