import 'package:flutter/material.dart';

class VerifyButtonOtpScreen extends StatelessWidget {
  const VerifyButtonOtpScreen({Key? key , required this.onPressed}) : super(key: key);
  final onPressed ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: const Size(110, 50),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
        child: const Text('Verify',
    style: TextStyle(color: Colors.white , fontSize: 16),),
    );
  }
}
