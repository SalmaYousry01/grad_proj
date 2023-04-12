import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grad_project/Profile/clinicProfile_navigator.dart';
import 'package:grad_project/basenavigator.dart';
import 'package:grad_project/Profile/clinic_viewmodel.dart';
import 'package:grad_project/login/doctor_login.dart';
import 'package:provider/provider.dart';

import '../models/my_doctor.dart';

class ClinicProfile extends StatefulWidget {
  static const String routeName = "Clinicprofile";

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends BaseView<ClinicProfile, ClinicViewModel>
    with SingleTickerProviderStateMixin
    implements clinicProfileNavigator {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();
  var startTimeController = TextEditingController();
  var endTimeController = TextEditingController();
  var feesController = TextEditingController();
  var aboutController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
    GetDataFromDatabase();
  }

  // TimeOfDay startTime = TimeOfDay.now();
  // TimeOfDay endTime = TimeOfDay.now();
  String? name = '';
  String? field = '';

  Future GetDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection(DoctorDataBase.COLLECTION_NAME)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) async {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!["fullName"];
          field = snapshot.data()!["Field"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
                elevation: 0.0,
                bottomOpacity: 0.0,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushNamed(context, DoctortLogin.routeName);
                    },
                    icon: Icon(Icons.arrow_back_outlined),
                    color: Colors.black,
                  ),
                ))),
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    height: 290.0,
                    child: new Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[],
                            )),
                        new Stack(fit: StackFit.loose, children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                  width: 340.0,
                                  height: 190.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                          'assets/images/d.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: 140.0, right: 100.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new CircleAvatar(
                                    backgroundColor: Color(0xFF2C698D),
                                    radius: 25.0,
                                    child: new Icon(Icons.camera_alt,
                                        color: Colors.white),
                                  )
                                ],
                              )),
                        ]),
                        Container(
                          width: 175,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 1, color: Color(0xFF2C698D)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Dr : " + name!,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Field: " + field!,
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Clinic',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status
                                          ? _getEditIcon()
                                          : new Container(),
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Address',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(height: 7),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      controller: addressController,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Your Clinic Address',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.69),
                                            borderSide: BorderSide(
                                                color: Color(0xFF2C698D))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.69),
                                            borderSide: BorderSide(
                                                color: Color(0xFF2C698D))),
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Phone',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(height: 7),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      keyboardType: TextInputType.number,
                                      controller: phoneController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Clinic Number',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.69),
                                            borderSide: BorderSide(
                                                color: Color(0xFF2C698D))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.69),
                                            borderSide: BorderSide(
                                                color: Color(0xFF2C698D))),
                                      ),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Availability',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(height: 7),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: new TextField(
                                        controller: startTimeController,
                                        decoration: InputDecoration(
                                          hintText: 'Start Time',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.69),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF2C698D))),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.69),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF2C698D))),
                                        ),
                                        enabled: !_status,
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: new TextField(
                                        controller: endTimeController,
                                        decoration: InputDecoration(
                                          hintText: 'End Time',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.69),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF2C698D))),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.69),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF2C698D))),
                                        ),
                                        enabled: !_status,
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          // Padding(
                          //   padding: const EdgeInsets.only(top:20,left: 50.0),
                          //   child: ListView(
                          //     shrinkWrap: true,
                          //     children: [
                          //       _buildTimePick("Start", true, startTime, (x) {
                          //         setState(() {
                          //           startTime = x;
                          //           print("The picked time is: $x");
                          //           enabled: !_status;
                          //         });
                          //       }),
                          //       const SizedBox(height: 10),
                          //       _buildTimePick("End", true, endTime, (x) {
                          //         setState(() {
                          //           endTime = x;
                          //           print("The picked time is: $x");
                          //           enabled: !_status;
                          //         });
                          //       }),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: new Text(
                                        'Fees',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          SizedBox(height: 7),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: new TextField(
                                        controller: feesController,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Your Fees',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.69),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF2C698D))),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7.69),
                                              borderSide: BorderSide(
                                                  color: Color(0xFF2C698D))),
                                        ),
                                        enabled: !_status,
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'About',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      controller: aboutController,
                                      decoration: InputDecoration(
                                        hintText: 'About Your Clinic',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.69),
                                            borderSide: BorderSide(
                                                color: Color(0xFF2C698D))),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.69),
                                            borderSide: BorderSide(
                                                color: Color(0xFF2C698D))),
                                      ),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          !_status ? _getActionButtons() : new Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  height: 50,
                  child: new ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF2C698D),
                    ),
                    child: new Text("Save"),
                    onPressed: () {
                      ClinicViewModel();
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                height: 50,
                child: new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF2C698D),
                  ),
                  child: new Text("Cancel"),
                  onPressed: () {
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  },
                ),
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Color(0xFF2C698D),
        radius: 18.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 20.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

  @override
  ClinicViewModel initViewModel() {
    return ClinicViewModel();
  }

// Future selectedTime(BuildContext context, bool ifPickedTime,
//     TimeOfDay initialTime, Function(TimeOfDay) onTimePicked) async {
//   var _pickedTime =
//       await showTimePicker(context: context, initialTime: initialTime);
//   if (_pickedTime != null) {
//     onTimePicked(_pickedTime);
//   }
// }

// Widget _buildTimePick(String title, bool ifPickedTime, TimeOfDay currentTime,
//     Function(TimeOfDay) onTimePicked) {
//   return Row(
//     children: [
//       SizedBox(
//         width: 80,
//         child: Text(
//           title,
//         ),
//       ),
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//         decoration: BoxDecoration(
//           border: Border.all(),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: GestureDetector(
//           child: Text(
//             currentTime.format(context),
//           ),
//           onTap: () {
//             selectedTime(context, ifPickedTime, currentTime, onTimePicked);
//           },
//         ),
//       ),
//     ],
//   );
// }
}
