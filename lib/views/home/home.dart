import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/models/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    final images = [
      {
        "image": Images.bp,
        "name": Strings.bloodPressure,
        "route": RouteConfig.lastReading,
      },
      // {"image": Images.temperature, "name": "Temperature"},
      {
        "image": Images.pulseOxy,
        "name": Strings.pulseOxymeter,
        "route": RouteConfig.lastReading,
      },
      {
        "image": Images.weight,
        "name": Strings.weight,
        "route": RouteConfig.lastReading,
      },
    ];

    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              itemCount: images.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 150,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  homeViewModel.navigateTo(images[index]['name']) ;
                  Navigator.of(context).pushNamed(images[index]["route"].toString());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.neutralVariant80,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: AppColors.homeCardColor,
                        elevation: 4,
                        child: Container(
                          height: 70,
                          width: 70,
                          padding: const EdgeInsets.all(16),
                          child: SvgPicture.asset(
                            images[index]['image'] ?? "",
                            height: 48,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          images[index]['name'] ?? "",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryPallete,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
