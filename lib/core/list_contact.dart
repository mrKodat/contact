import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact/core/contact_model.dart';

class ListContactMethods {
  CollectionReference contact = FirebaseFirestore.instance.collection('group');

  Stream<List<ContactModel>> listContact(groupName) {
    List<ContactModel> list = [];
    var last = contact.doc(groupName).collection("contact");
    return last.snapshots().map((QuerySnapshot querySnapshot) {
      list = querySnapshot.docs
          .map((document) => ContactModel.fromSnapshot(document))
          .toList()
          .cast<ContactModel>();
      print(list.length);
      print(list[0].name);
      return list;
    });
  }
}
