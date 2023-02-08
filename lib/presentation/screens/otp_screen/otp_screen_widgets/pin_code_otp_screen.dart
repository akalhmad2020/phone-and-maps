import 'package:flutter/material.dart';
import 'package:phone_app/constants/colors/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class PinCodeOtpScreen extends StatelessWidget {
    PinCodeOtpScreen({Key? key , required this.width , required this.height}) : super(key: key);

  final double width ;
  final double height ;
  static late String otpCode ;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 6,
      keyboardType: TextInputType.number,
      autoFocus: true,
      obscureText: false,
      animationType: AnimationType.fade,
      cursorColor: Colors.black,

      animationDuration: const Duration(milliseconds: 300),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box ,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: height,
        fieldWidth: width,
        activeFillColor: Colors.white,
      selectedColor: Colors.blueAccent,
      inactiveColor: Colors.lightBlue ,

      ),
      onCompleted: (v) {
       otpCode  = v ;
      },
      onChanged: (v){

      },
    );
  }

static  String getOtpCode(){
    return otpCode;
  }

}
