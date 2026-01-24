//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../core/constants/app_static.dart';
//
//
// class EditProfile extends StatelessWidget {
//   const EditProfile({super.key, required this.user});
//
//   final User user;
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = TextEditingController(text: user.name);
//     return Padding(
//       padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
//       child: Column(
//         spacing: 12,
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: GestureDetector(
//               onTap: () async {
//                 final RenderBox box = context.findRenderObject() as RenderBox;
//                 final Offset position = box.localToGlobal(Offset.zero);
//
//                 final selected = await showMenu<String>(
//                   context: context,
//                   position: RelativeRect.fromDirectional(
//                     textDirection: TextDirection.rtl,
//                     start: position.dx,
//                     top: position.dy + 45 * 2,
//                     end: position.dx + box.size.width,
//                     bottom: 0,
//                   ),
//                   items: [
//                     PopupMenuItem(
//                       value: 'delete',
//                       child: Text(AppStatic.kDeletePhoto),
//                     ),
//                     PopupMenuItem(
//                       value: 'gallery',
//                       child: Text(AppStatic.kPickFromGallery),
//                     ),
//                   ],
//                 );
//                 selected;
//               },
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   UserAvatar(radius: 45, image: user.image),
//                   AdaptiveText(
//                     AppStatic.kChangePhoto,
//                     style: const TextStyle(fontSize: 14),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           LabelField(text: AppStatic.kEnterYourName),
//           CustomTextField(
//             controller: controller,
//             hint: AppStatic.kEnterYourName,
//           ),
//
//           CustomElevatedButton(
//             onPressed: () {
//               GoRouter.of(context).pop(controller.text);
//             },
//             title: AppStatic.kSave,
//           ),
//         ],
//       ),
//     );
//   }
// }
