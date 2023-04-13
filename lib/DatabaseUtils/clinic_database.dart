import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grad_project/models/my_clinic.dart';

class DatabaseUtilsClinic {
  static CollectionReference<MyClinic> getClinicsCollection() {
    return FirebaseFirestore.instance.collection(MyClinic.CLINIC_PROFILE)
        .withConverter<MyClinic>(fromFirestore: (snapshot, options) =>
        MyClinic.fromJson(snapshot.data()!),
      toFirestore: (MyClinic, options) => MyClinic.tojson(),);
  }

  static Future<void> AddClinicToFirestore(MyClinic clinic) {
    // var collection=getClinicsCollection();
    // var docRef=collection.doc();
    // clinic.catId=docRef.id;
    // return docRef.set(clinic);
    return getClinicsCollection().doc(clinic.id).set(clinic);
  }


}