import 'package:cloud_firestore/cloud_firestore.dart';

class AddContactMethods {
  CollectionReference contact = FirebaseFirestore.instance.collection("group");
  Future<void> addContact(contactData, groupName) {
    return contact
        .doc(groupName)
        .collection("contact")
        .add(contactData)
        .then((value) => print("Contact Added"))
        .catchError((error) => print("Failed to add contact: $error"));
  }
}
