import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/models/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BeneficiaryName extends StatelessWidget {
  const BeneficiaryName({
    this.showTag = false,
    super.key,
  });
  final bool showTag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColors.primaryPalleteDark,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showTag == true
              ? Consumer<HomeViewModel>(
                  builder: (context, value, child) => Container(
                    // height: appSize.height * 0.03,
                    margin: const EdgeInsets.only(left: 4),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: SvgPicture.asset(
                            value.currentImage!,
                            height: 24,
                            fit: BoxFit.contain,
                            color: AppColors.primaryPallete,
                          ),
                        ),
                        Text(
                          value.tagTitle!,
                          style: const TextStyle(
                            color: AppColors.primaryPallete,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            letterSpacing: 0.6,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          Text(
            "Beneficiary: ${Preferences.instance.getName()}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
