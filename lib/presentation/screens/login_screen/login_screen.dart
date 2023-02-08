import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_app/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:phone_app/constants/strings/strings_app.dart';
import 'package:phone_app/presentation/screens/login_screen/login_screen_widgets/login_screen_texts_components.dart';
import 'package:phone_app/presentation/screens/login_screen/login_screen_widgets/next_button_login_screen.dart';
import 'package:phone_app/presentation/screens/login_screen/login_screen_widgets/number_form_field_components.dart';
import 'package:phone_app/settings_app/info_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

      String phoneNumber  = ''  ;
  final GlobalKey<FormState> _phoneFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _phoneFormKey ,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20 , vertical: 40),
                child: InfoWidget(builder:  (c, deviceInfo){
                  return  Column(
                    children: [
                      LoginScreenTextComponents(firstText: 'what_is_your_phone_number'.tr().toString(),
                        firstColor: Colors.black,
                        firstFontSize: (deviceInfo.screenWidth - deviceInfo.localWidth )/1.4,
                        secondColor: Colors.black54,
                        secondFontSize: (deviceInfo.screenWidth - deviceInfo.localWidth )/2.1,
                        secondText: 'pleas_enter_your_phone_number_to_verify_your_account'.tr().toString(),
                        sizedBoxHeight:  (deviceInfo.screenWidth - deviceInfo.localWidth )/1.3 ,
                        firstFontWeight: FontWeight.bold ,
                        secondFontWeight: FontWeight.normal,),
                      SizedBox(height:  (deviceInfo.screenWidth - deviceInfo.localWidth )/0.35),
                      NumberFormFieldComponents(countryFlag: getFlagCountry('ps'), sizedBoxWidth: 16),
                      SizedBox(height: (deviceInfo.screenWidth - deviceInfo.localWidth )/0.7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:     [
                           NextButtonLoginScreen(onPressed: onPressedNextButton,),
                          _buildPhoneNumberSubmit()
                        ],
                      ),
                    ],
                  );
                }
                ),
              ),
          ),
        )
      ),
    );
  }

  String getFlagCountry(String countryCode){
  return countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397)); }


  Widget _buildPhoneNumberSubmit(){
    return BlocListener<PhoneAuthCubit , PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if(state is Loading){
          _showProgressIndicator(context);
        }
        if(state is PhoneNumberSubmitted){
          Navigator.pop(context);
          Navigator.of(context).pushNamed(AppStrings.kOtpScreen , arguments: phoneNumber);
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

 void onPressedNextButton(){
    _showProgressIndicator(context);
    _register(context);
 }

 Future<void> _register(BuildContext context) async{

    if(!_phoneFormKey.currentState!.validate()){
      Navigator.pop(context);
      return;
    }else{
      Navigator.pop(context);
      _phoneFormKey.currentState!.save();
      if(NumberFormFieldComponents.phoneNumber!.isNotEmpty){
        BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phoneNumber: '+970${NumberFormFieldComponents.phoneNumber!}' );
      }

    }
 }


}
