import 'package:firebase_auth/firebase_auth.dart';
import 'package:grad_project/DatabaseUtils/clinic_database.dart';
import 'package:grad_project/Profile/clinicProfile.dart';
import 'package:grad_project/Profile/clinicProfile_navigator.dart';
import 'package:grad_project/basenavigator.dart';
import 'package:grad_project/models/my_clinic.dart';

class ClinicViewModel extends BaseViewModel<clinicProfileNavigator> {
  // var auth = FirebaseAuth.instance;

  void AddClinicToDB(String address, String phoneNumber, String startTime,
      String endTime, String fees, String about)  {
    // final credential = await auth.getRedirectResult();
    MyClinic clinic = MyClinic(
        address: address,
        phoneNumber: phoneNumber,
        startTime: startTime,
        endTime: endTime,
        fees: fees,
        about: about,
        // id: credential.user?.uid ?? ""
        );
    DatabaseUtilsClinic.AddClinicToFirestore(clinic).then((value) {
      print("Clinic added");
    }).catchError((error) {});
  }
}
