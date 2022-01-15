import 'package:cloud_firestore/cloud_firestore.dart';

class ContactModel {
  String userId;
  String name;
  String surName;
  String userEmail;
  String phoneNumber;

  ContactModel(
      {required this.userId,
      required this.name,
      required this.surName,
      required this.userEmail,
      required this.phoneNumber});

  static ContactModel fromSnapshot(DocumentSnapshot snap) {
    return ContactModel(
      userId: snap.get("userId"),
      name: snap.get("name"),
      surName: snap.get("surName"),
      userEmail: snap.get("userEmail"),
      phoneNumber: snap.get("phoneNumber"),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['userId'] = userId;
    data['name'] = name;
    data['surName'] = surName;
    data['userEmail'] = userEmail;
    data['phoneNumber'] = phoneNumber;

    return data;
  }
}
