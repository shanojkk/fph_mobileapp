import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/models/biometric/biometric_view_model.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewHistoryHeader extends StatelessWidget {
  const ViewHistoryHeader({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: AppColors.primary90,
            ),
          ),
        ),
        child: Consumer<BiometricViewModel>(builder: (context, viewModel, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Last Reading",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryPallete,
                      fontSize: 16,
                      height: 1.2,
                    ),
                  ),
                  if (viewModel.biometricReading != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 8),
                      child: Text(
                        viewModel.biometricReading?.readOn ?? "",
                        style: const TextStyle(
                          color: AppColors.neutralVariant40,
                          height: 1.16,
                        ),
                      ),
                    ),
                  if (viewModel.biometricReading != null)
                    Text(
                      "${viewModel.biometricReading?.schedule.target?.mealInfo}, ${viewModel.biometricReading?.schedule.target?.medicineInfo}",
                      style: const TextStyle(
                        color: AppColors.neutralVariant40,
                        height: 1.16,
                      ),
                    )
                  else
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text("No Data",
                          style: TextStyle(
                            color: AppColors.neutralVariant40,
                            height: 1.16,
                          )),
                    ),
                ],
              ),
              SizedBox(
                child: AppButton(
                  onTap: () {
                    // context.pushNamed(RouteConfig.history);
                  },
                  text: "View History",
                  backgroundColor: Colors.transparent,
                  outlined: true,
                  textColor: AppColors.primaryPallete,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          );
        }));
  }
}
