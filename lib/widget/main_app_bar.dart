// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:get/get.dart';

// import '../Models/profile/profile_model.dart';
// import '../config/colors.dart';
// import '../config/text_style.dart';
// import '../redux/app_state.dart';

// class MainAppBar extends StatefulWidget {
//   const MainAppBar({super.key});

//   @override
//   State<MainAppBar> createState() => _MainAppBarState();
// }

// class _MainAppBarState extends State<MainAppBar> {
//   // Profile? profile;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, Profile>(
//         converter: (store) =>
//             store.state.profile ??
//             Profile(
//               firstName: '',
//               lastName: '',
//             ),
//         builder: (context, Profile profile) {
//           return Column(
//             children: [
//               SizedBox(height: MediaQuery.of(context).padding.top + 15),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 20,
//                   right: 20,
//                   bottom: 10,
//                 ),
//                 child: Row(
//                   children: [
//                     const SizedBox(width: 14),
//                     Text(
//                       "${profile.firstName ?? ''} ${profile.lastName ?? ""}",
//                       style: pSemiBold18.copyWith(
//                         fontSize: 18,
//                       ),
//                     ),
//                     const Expanded(child: SizedBox()),
//                     GestureDetector(
//                       onTap: () {
//                         Get.to(
//                           () => const NotificationPage(),
//                         );
//                       },
//                       child: Container(
//                         height: 40,
//                         width: 40,
//                         decoration: BoxDecoration(
//                           color: ConstColors.fontColor,
//                           borderRadius: BorderRadius.circular(14),
//                         ),
//                         child: const Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.notifications_none,
//                             color: Colors.white,
//                             size: 22,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           );
//         });
//   }
// }
