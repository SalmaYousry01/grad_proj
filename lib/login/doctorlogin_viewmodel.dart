import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grad_project/DatabaseUtils/doctor_database.dart';
import 'package:grad_project/shared/components/firebase_errors.dart';
import '../models/my_doctor.dart';

class doctorloginViewModel extends ChangeNotifier{
  var auth =FirebaseAuth.instance;

 void DoctorloginWithFirebaseAuth(String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      
      DoctorDataBase? myUser =
          await DatabaseUtilsdoctor.readUserFromFiresore(credential.user?.uid ?? "");
      if (myUser != null) {
        //Go To Home
        return;
      }
    } on FirebaseAuthException catch (e) {
  if (e.code == FirebaseError.Wrongemail) {
    print('no match fount please enter the right email.');
  } else if (e.code == FirebaseError.weakPassword) {
    print('password not correct.');
  }
} catch (e) {
  print(e);
}
  }
}