import 'package:contact/core/handle_permission.dart';
import 'package:contact/ui/left_bar.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class AllContact extends StatefulWidget {
  const AllContact({
    Key? key,
  }) : super(key: key);

  @override
  State<AllContact> createState() => _AllContactState();
}

class _AllContactState extends State<AllContact> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 25, left: 20),
            child: Text(
              "Tüm Kişiler",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  if (contacts != null) {
                    Contact c = contacts.elementAt(index);
                    return ListTile(
                      leading: Align(
                          widthFactor: 1,
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.grey.shade500,
                            child: Text(
                              c.displayName.toString()[0],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )),
                      subtitle: Text(c.phones!.first.value.toString()),
                      title: Text(c.displayName.toString()),
                    );
                  } else {
                    return Container();
                  }
                }),
          )
        ],
      ),
    );
  }
}
