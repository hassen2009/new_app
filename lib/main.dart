import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:new_app/Db/dbhelper.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:new_app/barpages/welcomescreen.dart';
import '../empl/services.dart';
import '../barpages/themess.dart';
import 'package:new_app/homepage/authentification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'homepage/models/notifications.dart';


const kWebRecaptchaSiteKey = '6Lemcn0dAAAAABLkf6aiiHvpGD6x-zF3nOSDU2M8';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotifyHelper().initializeNotification();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider(kWebRecaptchaSiteKey),
    // Default provider for Android is the Play Integrity provider. You can use the "AndroidProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Safety Net provider
    // 3. Play Integrity provider
    androidProvider: AndroidProvider.debug,
    // Default provider for iOS/macOS is the Device Check provider. You can use the "AppleProvider" enum to choose
    // your preferred provider. Choose from:
    // 1. Debug provider
    // 2. Device Check provider
    // 3. App Attest provider
    // 4. App Attest provider with fallback to Device Check provider (App Attest provider is only available on iOS 14.0+, macOS 14.0+)
    appleProvider: AppleProvider.appAttest,
  );
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(const MyApp());
  initializeDateFormatting('fr_FR', null).then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authprovider()),
      ],
      child: GetMaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('fr', 'FR'),
          Locale('en', 'EN'),
          Locale('ar', 'AR')
        ],
        debugShowCheckedModeBanner: false,
        theme: Hmode.lightTheme,
        darkTheme: Hmode.darkTheme,
        themeMode: themeservices().theme,
        home: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: welcomescreen(),
        ),
      ),
    );
  }
}
