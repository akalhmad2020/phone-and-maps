 import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_app/constants/strings/strings_app.dart';
 import 'package:phone_app/main/routs.dart';

import 'package:phone_app/presentation/screens/login_screen/login_screen.dart';
import '../firebase_options.dart';


late String initRoute  ;
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();


  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAuth.instance.authStateChanges().listen((event) {
    if(event == null){
      initRoute = AppStrings.kLoginScreen ;
    }else {
      initRoute = AppStrings.kMapScreen ;
    }
  });

  runApp( EasyLocalization(
      supportedLocales: const [
        Locale('ar' , 'PL'),
        Locale('en' , 'US'),
      ],
      saveLocale: true,
      path: 'assets/translations',
      fallbackLocale:  const Locale('en' , 'US') ,
      child: MyApp(appRoutes: AppRoutes(),)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key , required this.appRoutes});
  final AppRoutes appRoutes ;
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.generateRouts ,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: initRoute,
    );
  }
}
