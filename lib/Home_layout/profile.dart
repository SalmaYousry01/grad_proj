

import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({Key? key}) : super(key: key);
    static const String routeName = 'ProfileTab';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: (Colors.white),
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
          Container(
          decoration: BoxDecoration(
          color: Color(0xFF22C698D),
          borderRadius: BorderRadius.circular(15)),
      width: 377,
      height: 125,
      margin: EdgeInsets.only(top: 20, left: 10, right: 9),
      child: Row(
        children: [
          Container(
            width:90,
            height: 150,
            child: Image.asset(
                'assets/images/user.png'
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "username",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          SizedBox(
            width: 3,
          ),
          Icon(Icons.edit),
          SizedBox(
            width: 50,
          ),
          Icon(
            Icons.qr_code,
            color: Colors.white,
            size: 90,
          )
        ],
      ),
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.only(top: 8, left: 55, right: 55),
    child: Container(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    "Phone number",
    style: TextStyle(color: Color(0xFF22C698D)),
    ),
    SizedBox(
    height: 10,
    ),
    TextFormField(
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Color(0xFF22C698D),
    )),
    suffixIcon: Icon(
    Icons.edit,
    color: Colors.black,
    ),
    prefixIcon: Icon(Icons.phone,
    color: Color(0xFF22C698D)),
    border: OutlineInputBorder()),
    ),
    SizedBox(
    height: 10,
    ),
    Padding(
    padding: const EdgeInsets.only(
    top: 8, left: 0, right: 0),
    child: Container(
    child: Column(
    mainAxisAlignment:
    MainAxisAlignment.start,
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text("Email Address",
    style:
    TextStyle(color: Color(0xFF22C698D)),
    ),
    SizedBox(
    height: 10,
    ),
    TextFormField(
    decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Color(0xFF22C698D),
    )),
    prefixIcon: Icon(
    Icons.email_outlined,
    color: Color(0xFF22C698D),
    ),
    border: OutlineInputBorder()),
    ),
    SizedBox(height: 10),
    Padding(
    padding:
    const EdgeInsets.only(left: 180),
    child: Text(
    "change password?",
    style: TextStyle(
    color: Color(0xFF22C698D)),
    )),
    Padding(
    padding: const EdgeInsets.only(
    top: 8, left: 0, right: 0),
    child: Container(
    child: Column(
    mainAxisAlignment:
    MainAxisAlignment.start,
    crossAxisAlignment:
    CrossAxisAlignment.start,
    children: [
    Text(
    "password",
    style: TextStyle(
    color: Color(0xFF22C698D)),
    ),
    SizedBox(
    height: 10,
    ),
    TextFormField(
    decoration: InputDecoration(
    enabledBorder:
    OutlineInputBorder(
    borderSide:
    BorderSide(
    color: Color(0xFF22C698D),
    )),
    prefixIcon: Icon(
    Icons.lock_outline_rounded,
    color: Color(0xFF22C698D),
    ),
    hintText: ("********"),
    suffixIcon: Icon(
    Icons.remove_red_eye,
    color: Colors.black,
    ),
    border: OutlineInputBorder()),
    ),
    SizedBox(height: 10,
    ),
      Padding(
        padding: const EdgeInsets.only(
            top: 8, left: 0, right: 0),
        child: Container(
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.start,
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Text(
                "confirm password",
                style: TextStyle(
                    color: Color(
                        0xFF22C698D)),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration:
                InputDecoration(
                    enabledBorder:
                    OutlineInputBorder(
                        borderSide:
                        BorderSide(
                          color: Color(
                              0xFF22C698D),
                        )),
                    prefixIcon: Icon(
                      Icons
                          .lock_outline_rounded,
                      color: Color(
                          0xFF22C698D),
                    ),
                    hintText:
                    ("*********"),
                    suffixIcon: Icon(
                      Icons
                          .remove_red_eye,
                      color: Colors
                          .black,
                    ),
                    border:
                    OutlineInputBorder()),
              )
            ],
          ),
        ),
      )
    ],
    ),
    ),
    )
    ])))
    ])))
          ]),
      ));
  }
}