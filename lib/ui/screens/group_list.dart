import 'package:contact/core/add_contact.dart';
import 'package:contact/core/contact_model.dart';
import 'package:contact/core/handle_permission.dart';
import 'package:contact/core/list_contact.dart';
import 'package:contact/ui/left_bar.dart';
import 'package:contact/ui/widget/create_group_dialog.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class GroupList extends StatefulWidget {
  final String groupName;
  const GroupList({Key? key, required this.groupName}) : super(key: key);

  @override
  State<GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  List<Contact> contacts = [];
  @override
  void initState() {
    super.initState();
    askPermissions();
    getContactall();
  }

  Future<bool> permissionState = askPermissions();

  //List<Contact>? _contacts;
  getContactall() async {
    permissionState.then((value) async {
      if (value) {
        List<Contact> _contacts = await ContactsService.getContacts(
          withThumbnails: false,
          photoHighResolution: false,
        );
        setState(() {
          contacts = _contacts;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            elevation: 0,
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: LeftBar()),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25, left: 20),
                        child: Text(
                          widget.groupName,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                barrierColor: Colors.transparent,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.transparent,
                                      content: Container(
                                        width: double.maxFinite,
                                        padding: const EdgeInsets.all(20),
                                        margin: const EdgeInsets.only(top: 35),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  offset: Offset(0, 10),
                                                  blurRadius: 10),
                                            ]),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: contacts.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              if (contacts != null) {
                                                Contact c =
                                                    contacts.elementAt(index);
                                                return ListTile(
                                                  onTap: () {
                                                    ContactModel model =
                                                        ContactModel(
                                                            userId: "2",
                                                            name: c.displayName
                                                                .toString(),
                                                            surName: "surName",
                                                            userEmail:
                                                                "userEmail",
                                                            phoneNumber: c
                                                                .phones!
                                                                .first
                                                                .value
                                                                .toString());
                                                    AddContactMethods()
                                                        .addContact(
                                                            model.toJson(),
                                                            widget.groupName);
                                                    Navigator.of(context).pop();
                                                  },
                                                  leading: Align(
                                                      widthFactor: 1,
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: CircleAvatar(
                                                        radius: 25,
                                                        backgroundColor: Colors
                                                            .grey.shade500,
                                                        child: Text(
                                                          c.displayName
                                                              .toString()[0],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 18),
                                                        ),
                                                      )),
                                                  subtitle: Text(c
                                                      .phones!.first.value
                                                      .toString()),
                                                  title: Text(
                                                      c.displayName.toString()),
                                                );
                                              } else {
                                                return Container();
                                              }
                                            }),
                                      ));
                                });
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 25, right: 20),
                              child: Icon(Icons.add_circle_outline)))
                    ],
                  ),
                  Expanded(
                    child: StreamBuilder<List<ContactModel>>(
                        stream:
                            ListContactMethods().listContact(widget.groupName),
                        builder: (BuildContext context, AsyncSnapshot snap) {
                          if (snap.data != null) {
                            return ListView.builder(
                                itemCount: snap.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  if (contacts != null) {
                                    return ListTile(
                                      leading: Align(
                                          widthFactor: 1,
                                          alignment: Alignment.centerLeft,
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundColor:
                                                Colors.grey.shade500,
                                            child: Text(
                                              snap.data[index].name[0],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18),
                                            ),
                                          )),
                                      title: Text(snap.data[index].name),
                                      subtitle:
                                          Text(snap.data[index].phoneNumber),
                                    );
                                  } else {
                                    return Container();
                                  }
                                });
                          } else {
                            return Container();
                          }
                        }),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
