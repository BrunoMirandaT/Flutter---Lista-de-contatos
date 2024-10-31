import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addContactInfo(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("contato")
        .doc()
        .set(userInfoMap);
  }
}
