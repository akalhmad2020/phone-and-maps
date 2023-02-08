import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_app/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:phone_app/constants/strings/strings_app.dart';
import 'package:phone_app/presentation/screens/login_screen/login_screen_widgets/number_form_field_components.dart';
import 'package:phone_app/presentation/screens/otp_screen/otp_screen_widgets/otp_screen_texts_componants.dart';
import 'package:phone_app/presentation/screens/otp_screen/otp_screen_widgets/pin_code_otp_screen.dart';
import 'package:phone_app/presentation/screens/otp_screen/otp_screen_widgets/verify_button_otp_screen.dart';
import 'package:phone_app/settings_app/info_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key , required this.phoneNumber  }) : super(key: key);
   final String phoneNumber;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {


  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 40),
              child: InfoWidget(builder: (c,deviceInfo){
                return Column(
                  children: [
                    OtpScreenTextComponents(firstText: 'verify_your_phone_number'.tr().toString(),
                      firstColor: Colors.black,
                      firstFontSize: (deviceInfo.screenWidth - deviceInfo.localWidth )/1.4,
                      secondColor: Colors.black54,
                      secondFontSize: (deviceInfo.screenWidth - deviceInfo.localWidth )/2.1,
                      secondText: 'enter_your_6_digit_code_numbers_sent_to'.tr().toString(),
                      sizedBoxHeight:  (deviceInfo.screenWidth - deviceInfo.localWidth )/1.3 ,
                      firstFontWeight: FontWeight.bold ,
                      secondFontWeight: FontWeight.normal,
                    thirdText: '+970${NumberFormFieldComponents.phoneNumber}'),
                    SizedBox(height:  (deviceInfo.screenWidth - deviceInfo.localWidth )/0.35),
                      PinCodeOtpScreen(height: (deviceInfo.screenWidth - deviceInfo.localWidth )/0.8 ,
                     width : (deviceInfo.screenWidth - deviceInfo.localWidth )/0.9),
                    SizedBox(height:  (deviceInfo.screenWidth - deviceInfo.localWidth )/0.35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:   [
                         VerifyButtonOtpScreen(onPressed: onPressedVerifyButtonOtp),
                        _buildPhoneVerificationBloc()
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneVerificationBloc(){
    return BlocListener<PhoneAuthCubit , PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if(state is Loading){
          _showProgressIndicator(context);
        }
        if(state is PhoneOtpVerified){

          Navigator.pop(context);
          Navigator.of(context).pushReplacementNamed(AppStrings.kMapScreen );
        }

        if(state is ErrorOccurred){
          String errorMessage = state.errorMessage ;
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(errorMessage) ,
                backgroundColor: Colors.black,
                duration: const Duration(seconds: 3),)
          );
        }
      }, child: Container(),);
  }


  void _showProgressIndicator(BuildContext context){
    AlertDialog alertDialog = const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
    showDialog(
      barrierColor: Colors.white.withOpacity(0),
      context: context,
      builder: (c)=> alertDialog,);
  }

  void onPressedVerifyButtonOtp(){
    _showProgressIndicator(context);
    _login(context);
  }

  void _login(BuildContext buildContext){
  otpCode = PinCodeOtpScreen.getOtpCode();
    BlocProvider.of<PhoneAuthCubit>(buildContext).submitOtpCode(otpCode);
  }

}
