class MyPatient {
  static const String COLLECTION_NAME = "Patients";
  String id;
  String fullname;
  String username;
  String email;
  String phonenumber;

  MyPatient(
      {required this.id,
      required this.email,
      required this.username,
      required this.fullname,
      required this.phonenumber});

  MyPatient.fromjson(Map<String, dynamic> json)
      : this(
          id: json["id"],
          fullname: json["fullname"],
          username: json["username"],
          phonenumber: json["phonenumber"],
          email: json["email"],
        );

  Map<String, dynamic> tojson() {
    return {
      "id": id,
      "fullname": fullname,
      "username": username,
      "phonenumber": phonenumber,
      "email": email,
    };
  }
}
