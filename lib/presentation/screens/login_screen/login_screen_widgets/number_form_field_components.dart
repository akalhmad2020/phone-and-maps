
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:phone_app/constants/colors/my_colors.dart';

// ignore: must_be_immutable
class NumberFormFieldComponents extends StatelessWidget {
     NumberFormFieldComponents({Key? key , required this.countryFlag , required this.sizedBoxWidth}) : super(key: key);
  final String countryFlag ;
  final double sizedBoxWidth ;

    static String? phoneNumber ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:   [
       Expanded(
           flex: 1,
           child: buildCodeCountry(countryFlag)),
        SizedBox(width: sizedBoxWidth,),
        Expanded(
            flex: 3,
            child: buildNumberPhoneTextField()),

      ],
    );
  }


  Widget buildCodeCountry(String flag){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12 , vertical:16),
      decoration:   BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: MyColors.kMyGry ),
      ),
      child: Text('$flag  +970'),
    );
  }

  Widget buildNumberPhoneTextField(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12 ),
      width: double.infinity,
      decoration:   BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: MyColors.kMyBlue ),
      ),
      child: TextFormField(
        autofocus: true,
        style: const TextStyle(
          fontSize: 18 ,
          letterSpacing: 2 ,
        ),
        decoration: const InputDecoration(
          border: InputBorder.none
        ),
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        validator: (vale){
          if(vale!.isEmpty){
            return 'pleas_enter_your_number'.tr().toString();
          }else if(vale.length != 9){
            return 'pleas_enter_correct_number'.tr().toString();
          }
          return null ;
        },
        onSaved: (value){
          if(value!.length == 9){
            phoneNumber = value !;
          }
        },
      ),
    );
  }




  }


