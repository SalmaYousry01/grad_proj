import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/Home_layout/calender/calender.dart';
import 'package:grad_project/Profile/clinicProfile.dart';
import 'create_account/patient_signup.dart';
import 'package:provider/provider.dart';
import 'package:grad_project/create_account/doctor_signup.dart';
import 'first_screen/first_page.dart';
import 'package:grad_project/Home_layout/home.dart';
import 'package:grad_project/Home_layout/notes/notes.dart';
import 'package:grad_project/Home_layout/profile.dart';

import 'firebase_options.dart';
import 'package:grad_project/Home_layout/navv.dart';
import 'login/doctor_login.dart';
import 'login/patient_login.dart';
import 'myprovider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      initialRoute: Firstpage.routeName,
      routes: {
        PatientSignup.routeName: (context) => PatientSignup(),
        DoctorSignup.routeName: (context) => DoctorSignup(),
        Firstpage.routeName: (context) => Firstpage(),
        home.routeName: (context) => home(),
        NotesTab.routeName: (context) => NotesTab(),
        ProfileTab.routeName: (context) => ProfileTab(),
        picker.routeName: (context) => picker(),
        navv.routeName: (context) => navv(),
        PatientLogin.routeName: (context) => PatientLogin(),
        DoctortLogin.routeName: (context) => DoctortLogin(),
        ClinicProfile.routeName:(c)=>ClinicProfile()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
