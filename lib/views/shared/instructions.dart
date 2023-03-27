import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/views/shared/bullet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Instructions extends StatelessWidget {
  const Instructions({required this.image, required this.textList, super.key});

  final String image;
  final List<String> textList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SvgPicture.asset(
          image,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: textList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Bullet(),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        textList[index],
                        style: const TextStyle(
                          color: AppColors.primaryPallete,
                          fontSize: 14,
                          letterSpacing: 1.5,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
