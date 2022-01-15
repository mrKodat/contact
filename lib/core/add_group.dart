import 'package:cloud_firestore/cloud_firestore.dart';

class AddGroupMethods {
  CollectionReference contact = FirebaseFirestore.instance.collection("group");
  Future<void> addGroup(groupName) {
    return contact
        .doc(groupName)
        .set({"name": groupName, "groupId": "1"})
        .then((value) => print("Contact Added"))
        .catchError((error) => print("Failed to add contact: $error"));
  }
}
