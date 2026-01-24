// import 'package:flutter/material.dart';
//
// import '../../../../core/constants/app_assets.dart';
//
// class UserAvatar extends StatelessWidget {
//   const UserAvatar({super.key, required this.image, this.radius = 38});
//
//   final String? image;
//   final double radius;
//
//   @override
//   Widget build(BuildContext context) {
//     return CircleAvatar(
//       radius: radius,
//       backgroundColor: Colors.white.withValues(alpha: 0.2),
//       child: ClipOval(
//         child: Builder(
//           builder: (context) {
//             if (image != null && image!.isEmpty) {
//               return CircleAvatar(
//                 radius: radius - 2,
//                 backgroundImage: NetworkImage(image!),
//               );
//             }
//
//             return CircleAvatar(
//               radius: radius - 2,
//               backgroundImage: const AssetImage(AppAssets.profile),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }