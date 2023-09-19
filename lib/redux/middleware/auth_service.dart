// import 'dart:convert';

// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:get/get.dart';
// import 'package:redux/redux.dart';

// import '../../config/urls.dart';
// import '../../utils/my_shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class AuthService {
//   Future<String> userProfile(Profile profile) async {
//     try {
//       Map profileMap = profile.toMap();
//       if ((profile.referredBy ?? '').isEmpty) {
//         profileMap.remove('referredBy');
//       }

//       profileMap.remove('id');
//       profileMap.remove('email');

//       String token = await FirebaseAuth.instance.currentUser!.getIdToken();

//       Object body = jsonEncode(
//         profileMap,
//       );

//       http.Response response = await http.post(
//         Uri.parse(FirebaseUrls.addProfileInfo()),
//         body: body,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $token"
//         },
//       );

//       if (response.statusCode == 200) {
//         return '';
//       } else {
//         Map resposneBody = jsonDecode(response.body);
//         if (resposneBody.containsKey('error')) {
//           if (resposneBody['error'].containsKey('message')) {
//             return resposneBody['error']['message'].toString();
//           }
//         }
//         return 'Something went wrong. Please try again later!';
//       }
//       // FirebaseFirestore db = FirebaseFirestore.instance;
//       // Map<String, dynamic> profileMap = profile.toMap();
//       // await db.collection("users").doc(profile.id).set(profileMap);
//       // return '';
//     } catch (e) {
//       logger.d(e.toString());
//       if (e is AssertionError) {
//         return e.message.toString().capitalizeFirst!;
//       } else if (e is FirebaseException) {
//         return e.message.toString().capitalizeFirst!;
//       }
//       return 'Something went wrong. Please try again';
//     }
//   }

//   Future<Profile?> userAlreadyExists(String id) async {
//     try {
//       FirebaseFirestore db = FirebaseFirestore.instance;
//       bool userExists = false;
//       await db.collection("users").doc(id).get().then((value) {
//         userExists = value.exists;
//       });
//       if (userExists) {
//         Profile profile = Profile();
//         await db.collection("users").doc(id).get().then(
//           (value) {
//             profile = Profile.fromMap(value.data() ?? {});
//           },
//         );

//         return profile;
//       }
//     } catch (e) {
//       logger.d(e.toString());
//     }

//     return null;
//   }

// /*
//   Future<void> updateUserProfile(Profile? profile) async {
//     try {
//       FirebaseFirestore db = FirebaseFirestore.instance;
//       Map<String, dynamic> profileMap = profile!.toMap();
//       await db.collection("users").doc(profile.id).update(profileMap);
//       /* await db.collection("users").doc(profile.id).get().then(
//         (value) {
//           profile = Profile.fromMap(value.data() ?? {});
//         },
//       ); */

//       // ignore: use_build_context_synchronously
//       Store<AppState> store = StoreProvider.of<AppState>(GlobalContext.context);
//       store.dispatch(UpdateProfile(profile));
//     } catch (e) {
//       logger.d(e.toString());
//     }

//     // return null;
//   }
//  */
//   ///Check in the firebase if the user is Pro.
//   ///
//   ///Return the boolean value
//   Future<bool> checkUserPro() async {
//     try {
//       FirebaseFirestore db = FirebaseFirestore.instance;
//       String userId = FirebaseAuth.instance.currentUser!.uid;
//       Store<AppState> store = StoreProvider.of<AppState>(GlobalContext.context);
//       bool isPro = store.state.profile?.isPro ?? false;
//       var values = await db.collection("users").doc(userId).get();
//       if (!values.exists) {
//         isPro = false;
//       }

//       Map? valueData = values.data();

//       if (valueData != null && values.data()!['isPro'] == true) {
//         isPro = true;
//       }

//       if (store.state.profile != null) {
//         store.state.profile?.isPro = true;
//         store.dispatch(UpdateProfile(store.state.profile!));
//       }

//       // store.dispatch(UpdateProValue(isPro));
//       return isPro;
//     } catch (e) {
//       logger.d(e.toString());
//     }

//     return false;
//   }

//   Future logout() async {
//     await MySharedPreference().logout();
//     Get.offAll(() => const LandingScreen());
//     await FirebaseAuth.instance.signOut();
//     await Magic.instance.user.logout();
//   }
// }
