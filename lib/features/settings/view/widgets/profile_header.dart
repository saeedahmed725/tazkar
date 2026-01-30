// import 'package:awesome_extensions/awesome_extensions.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:super_icons/super_icons.dart';
//
// import '../../../../core/constants/app_static.dart';
// import '../../../../core/locator/locator.dart';
// import '../../../../core/utils/components/sheets.dart';
// import 'edit_profile.dart';
// import 'user_avatar.dart';
//
// class ProfileHeader extends StatelessWidget {
//   const ProfileHeader({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final userService = ServiceLocator.get<UserService>();
//     return userService.buildUserDependentWidget(
//       builder: (user) => Center(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 16.0 + kToolbarHeight * 1.3),
//           child: Column(
//             spacing: 12,
//             children: [
//               UserAvatar(image: user.image),
//               Text(
//                 user.name,
//                 style: context.theme.textTheme.titleLarge?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 6),
//               OutlinedButton.icon(
//                 style: OutlinedButton.styleFrom(
//                   foregroundColor: context.primaryColor,
//                   side: BorderSide(color: context.primaryColor),
//                 ),
//                 icon: const Icon(SuperIcons.ev_edit),
//                 label: Text(AppStatic.kEditProfile),
//                 onPressed: () => Sheets.showModel(
//                   context,
//                   isScrollControlled: true,
//                   child: EditProfile(user: user),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
