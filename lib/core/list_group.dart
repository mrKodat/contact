import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact/core/group_model.dart';

class ListGroupMethods {
  CollectionReference contact = FirebaseFirestore.instance.collection('group');

  Stream<List<GroupModel>> listGroup() {
    List<GroupModel> list = [];

    return contact.snapshots().map((QuerySnapshot querySnapshot) {
      list = querySnapshot.docs
          .map((document) => GroupModel.fromSnapshot(document))
          .toList()
          .cast<GroupModel>();
      print(list.length);
      print(list[0].name);
      return list;
    });
  }
}
