import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addContactInfo(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("contato")
        .doc()
        .set(userInfoMap);
  }
  Future editContactInfo(Map<String, dynamic> userEditMap, id) async {
    return await FirebaseFirestore.instance
        .collection("contato")
        .doc(id)
        .update(userEditMap);
  }
  
}
