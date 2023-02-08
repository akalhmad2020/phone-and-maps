import 'package:flutter/material.dart';
import 'package:phone_app/constants/strings/strings_app.dart';

class NextButtonLoginScreen extends StatelessWidget {
   const NextButtonLoginScreen({Key? key , required this.onPressed }) : super(key: key);
   final  onPressed ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: const Size(110, 50),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
        child: const Text('Next',
    style: TextStyle(color: Colors.white , fontSize: 16),),
    );
  }
}
