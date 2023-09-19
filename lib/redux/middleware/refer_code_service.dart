// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:currency/redux/actions.dart';
// import 'package:currency/redux/app_state.dart';
// import 'package:currency/utils/globals.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

// class ReferCodeService {
//   Future getReferCode() async {
//     FirebaseFirestore db = FirebaseFirestore.instance;
//     String userId = FirebaseAuth.instance.currentUser!.uid;
//     final doc = await db.collection("referralCodes").doc(userId).get();
//     String referC = (doc.data() ?? {})['referralCode'] ?? '';
//     // logger.d(referC);
//     // ignore: use_build_context_synchronously
//     Store<AppState> store = StoreProvider.of(GlobalContext.context);

//     store.dispatch(UpdateReferCode(referC));
//   }
// }
