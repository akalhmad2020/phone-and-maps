import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthInitial());

  late String  verificationId ;
  Future<void> submitPhoneNumber({required String phoneNumber}) async{
    emit(Loading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
        verificationCompleted:  verificationCompleted,
        verificationFailed: verificationFailed ,
        codeSent: codeSent,
        codeAutoRetrievalTimeout:codeAutoRetrievalTimeout   ,
    timeout: const Duration(seconds: 20));
  }

 void verificationCompleted  (PhoneAuthCredential phoneAuthCredential) async{
    await signIn(phoneAuthCredential);
  }

 void  verificationFailed (FirebaseAuthException firebaseAuthException){
    emit(ErrorOccurred(errorMessage: firebaseAuthException.message.toString()));
 }

 void codeSent(String verificationId, int? forceResendingToken){
    this.verificationId = verificationId ;
    emit(PhoneNumberSubmitted());
 }

  codeAutoRetrievalTimeout (s){
  }
  Future<void> submitOtpCode(String otpCode) async{
    PhoneAuthCredential phoneAuthCredential =
    PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpCode);

    await signIn(phoneAuthCredential);
  }
  Future<void> signIn(PhoneAuthCredential credential) async{
    try{
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(PhoneOtpVerified());
    }catch(e){
      emit(ErrorOccurred(errorMessage: e.toString()));
    }
  }

  Future<void> logOut() async => await FirebaseAuth.instance.signOut();

  User getLoggedInUser()=> FirebaseAuth.instance.currentUser! ;

}

