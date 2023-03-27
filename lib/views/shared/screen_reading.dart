// import 'package:family_pro_health/constants/app_colors.dart';
// import 'package:family_pro_health/constants/images.dart';
// import 'package:family_pro_health/views/shared/beneficiary_name.dart';
// import 'package:family_pro_health/views/shared/page_structure.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ScreenReading extends StatelessWidget {
//   const ScreenReading({required this.textList, super.key});
//   final List<String> textList;

//   @override
//   Widget build(BuildContext context) {
//     return PageStructure(
//       title: 'Take Reading',
//       backGroundColor: Colors.white,
//       selected: 0,
//       showSelected: true,
//       showBack: true,
//       showNotification: false,
//       child: Column(
//         children: [
//           const BeneficiaryName(
//             showTag: true,
//           ),
//           SvgPicture.asset(
//             Images.vital,
//             fit: BoxFit.cover,
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           Expanded(
//             child: ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: textList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         MyBullet(),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                             child: Text(
//                           textList[index],
//                           style: const TextStyle(
//                               color: AppColors.primaryPallete,
//                               fontSize: 14,
//                               letterSpacing: 1.5),
//                         ))
//                       ],
//                     ),
//                   );
//                 }),
//           ),
//           showDialog(context),
//         ],
//       ),
//     );
//   }
// }
