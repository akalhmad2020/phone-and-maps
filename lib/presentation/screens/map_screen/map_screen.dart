import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_app/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:phone_app/constants/strings/strings_app.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();

  List<String> docIds = [] ;

  Future<void> getDocId()async{
    await FirebaseFirestore.instance.collection('users').get().then((value) {
      return value.docs.forEach((element) {

        print(element.reference);
        docIds.add(element.reference.id);
      });
    });

    Map<String,dynamic> data = {'first':'first one'};

    await FirebaseFirestore.instance.collection('users').add(data);

  }

  @override
  Widget build(BuildContext context)  {


    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: BlocProvider<PhoneAuthCubit>(create: (context)=>phoneAuthCubit ,
            child: Column(
              children: [

                FutureBuilder(
                    future:  getDocId(),
                    builder: (context , snapshot){

                  return Text('dddd');
                }),

                ElevatedButton(
                  onPressed: () async {
                    await phoneAuthCubit.logOut();
                    Navigator.of(context).pushReplacementNamed( AppStrings.kLoginScreen);
                  },
                  child: Text('log out') ,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(110, 50),
                  backgroundColor: Colors.black ,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  )
                ),),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
