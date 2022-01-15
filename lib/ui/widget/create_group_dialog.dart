import 'package:contact/core/add_contact.dart';
import 'package:contact/core/contact_model.dart';
import 'package:flutter/material.dart';

class CreateGroupDialog extends StatelessWidget {
  final String alertTitle;
  final String alertContent;
  final String buttonText;
  final Function tap;
//  final VoidCallback onClicked;

  const CreateGroupDialog(
      {Key? key,
      required this.alertTitle,
      required this.alertContent,
      required this.buttonText,
      required this.tap
      // required this.onClicked,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    final businessName = TextEditingController();
    return Stack(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 20, top: 60, right: 20, bottom: 20),
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                alertTitle,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          offset: Offset(1, 1),
                          blurRadius: 1.0,
                          spreadRadius: 1.0),
                    ]),
                child: TextField(
                  controller: businessName,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: ".. ",
                    hintStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.red,
                    onSurface: Colors.white,
                    shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ContactModel model = ContactModel(
                        userId: "",
                        name: "",
                        surName: "",
                        userEmail: "",
                        phoneNumber: "");
                    AddContactMethods()
                        .addContact(model.toJson(), businessName.text);
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        // Positioned(
        //   left: 20,
        //   right: 20,
        //   child: CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     radius: 45,
        //     child: ClipRRect(
        //         borderRadius: BorderRadius.all(Radius.circular(45)),
        //         child: Image.asset("assets/flag.png")),
        //   ),
        // ),
      ],
    );
  }
}
