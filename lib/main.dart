import 'package:cryp_wallet/redux/app_state.dart';
import 'package:cryp_wallet/redux/reducer.dart';
import 'package:cryp_wallet/screens/splash/splash_screen.dart';
import 'package:cryp_wallet/helpers/my_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPreference().init();

  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [thunkMiddleware],
  );
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatefulWidget {
  final Store<AppState>? store;
  const MyApp({
    Key? key,
    this.store,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return
    // Sizer(builder: (context, orientation, deviceType) {
    return StoreProvider<AppState>(
      store: widget.store!,
      child: GetMaterialApp(
        title: 'Tavecchiacoin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: const MaterialColor(
            0xff4BA8E6,
            <int, Color>{
              50: Color(0xff4BA8E6),
              100: Color(0xff4BA8E6),
              200: Color(0xff4BA8E6),
              300: Color(0xff4BA8E6),
              400: Color(0xff4BA8E6),
              500: Color(0xff4BA8E6),
              600: Color(0xff4BA8E6),
              700: Color(0xff4BA8E6),
              800: Color(0xff4BA8E6),
              900: Color(0xff4BA8E6),
            },
          ),
        ),
        home: const SplashScreen(),
      ),
    );
    // });
  }
}
