import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:grad_project/shared/components/firebase_errors.dart';
import 'package:grad_project/DatabaseUtils/doctor_database.dart';
import '../models/my_doctor.dart';

class DoctorSignupViewModel extends ChangeNotifier {
  void doctorSignupWithFirebaseAuth(String email,String password,String fullname,String idNumber,String phonenumber) async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Add Data to Database
      DoctorDataBase doctorDataBase = DoctorDataBase(
          email: email, fullName: fullname, nationalID: idNumber,phoneNumber: phonenumber,id: credential.user?.uid ?? "");
      DatabaseUtilsdoctor.AddUserToFirestore(doctorDataBase).then((value) => ((value){
        //Go To Home />>Login
      }));
      //Read User from Database
      // DoctorDataBase? doctorDataBase=await DatabaseUtils.readUserFromFiresore(credential.user?.uid??"");
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {
        print('The password provided is too weak.');
      } else if (e.code == FirebaseError.emailInUse) {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
