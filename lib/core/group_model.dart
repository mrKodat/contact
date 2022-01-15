import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  String groupId;
  String name;

  GroupModel({required this.groupId, required this.name});

  static GroupModel fromSnapshot(DocumentSnapshot snap) {
    return GroupModel(
      groupId: snap.get("groupId"),
      name: snap.get("name"),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['groupId'] = groupId;
    data['name'] = name;

    return data;
  }
}
