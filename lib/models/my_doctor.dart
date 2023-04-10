import 'dart:convert';

class DoctorDataBase {
  static const String COLLECTION_NAME ="Doctors";
  var id;
  String fullName;
  String phoneNumber;
  String email;
  String nationalID;

  DoctorDataBase(
      {required this.email, required this.fullName, required this.id, required this.phoneNumber,required this.nationalID});

  DoctorDataBase.fromJson(Map<String,dynamic>json):this(
      id: json["id"],
      fullName: json["fullName"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      nationalID: json["ID Number"]
  );
  Map<String,dynamic> tojson(){
    return{
      "id":id,
      "fullName":fullName,
      "email":email,
      "phoneNumber":phoneNumber,
      "ID Number":nationalID
    };
  }
}