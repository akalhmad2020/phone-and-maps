import 'package:flutter/material.dart';

class LoginScreenTextComponents extends StatelessWidget {
  final String firstText ;
  final Color firstColor ;
  final double firstFontSize ;
  final String secondText ;
  final Color secondColor ;
  final double secondFontSize ;
  final double sizedBoxHeight ;
  final FontWeight firstFontWeight ;
  final FontWeight secondFontWeight ;
  const LoginScreenTextComponents({
    Key? key ,
    required this.firstText ,
    required this.firstColor ,
    required this.firstFontSize ,
    required this.secondColor ,
    required this.secondFontSize ,
    required this.secondText ,
    required this.sizedBoxHeight ,
    required this.firstFontWeight,
    required this.secondFontWeight,
      }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:   [
         buildText(text: firstText, fontSize: firstFontSize, color: firstColor , fontWeight: firstFontWeight),
        SizedBox(height: sizedBoxHeight) ,
        buildText(text: secondText, fontSize: secondFontSize, color: secondColor , fontWeight: secondFontWeight),
      ],
    );
  }
}

 Widget buildText({required String text ,
   required double fontSize ,
   required Color color ,
   required FontWeight fontWeight,
 }){
  return Text(text,style: TextStyle(fontSize: fontSize , color: color , fontWeight: fontWeight ));

 }