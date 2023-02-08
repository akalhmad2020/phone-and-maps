import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_app/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:phone_app/constants/strings/strings_app.dart';
import 'package:phone_app/presentation/screens/login_screen/login_screen.dart';
import 'package:phone_app/presentation/screens/map_screen/map_screen.dart';
import 'package:phone_app/presentation/screens/otp_screen/otp_screen.dart';

class AppRoutes{

  PhoneAuthCubit? phoneAuthCubit ;

  AppRoutes(){
    phoneAuthCubit = PhoneAuthCubit();
  }
  Route? generateRouts(RouteSettings settings){
    switch(settings.name){

      case AppStrings.kMapScreen :
        return MaterialPageRoute(builder: (_)=> const MapScreen());

      case AppStrings.kOtpScreen :
        final String  phoneNumber = settings.arguments as String ;
        return MaterialPageRoute(builder: 
            (_)=> BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!,
                child:   OtpScreen(phoneNumber: phoneNumber ,)));
      case AppStrings.kLoginScreen :
        return MaterialPageRoute(builder:
            (_)=> BlocProvider<PhoneAuthCubit>.value(
                value: phoneAuthCubit!,
                child:  const LoginScreen())); }
  }
}