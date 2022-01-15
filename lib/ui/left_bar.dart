import 'dart:math';

import 'package:contact/core/add_contact.dart';
import 'package:contact/core/contact_model.dart';
import 'package:contact/core/group_model.dart';
import 'package:contact/core/list_group.dart';
import 'package:contact/ui/screens/group_list.dart';
import 'package:contact/ui/widget/create_group_dialog.dart';
import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  const LeftBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff223E6D),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: const Align(
                widthFactor: 1,
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Color(0xffFEB25B),
                  child: Text(
                    "+",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )),
            onTap: () {
              showDialog(
                  context: context,
                  barrierColor: Colors.transparent,
                  builder: (BuildContext ctx) {
                    return CreateGroupDialog(
                      buttonText: "Ekle",
                      alertContent: "Bir hata oluştu lütfen tekrar deneyin",
                      alertTitle: "Grup Adı",
                      tap: () {},
                    );
                  });
            },
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: StreamBuilder<List<GroupModel>>(
                stream: ListGroupMethods().listGroup(),
                builder: (BuildContext context, snapshot) {
                  if (snapshot.data != null) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (_, int index) {
                          return InkWell(
                              child: Column(
                                children: [
                                  Align(
                                      widthFactor: 1,
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                          radius: 25,
                                          backgroundColor: randomColor(),
                                          child:
                                              Image.asset("assets/group.png"))),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      snapshot.data![index].name,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          GroupList(
                                              groupName:
                                                  snapshot.data![index].name)),
                                );
                              });
                        });
                  } else {
                    return Container();
                  }
                }),
          ))
        ],
      ),
    );
  }

  static Color randomColor() {
    final colors = <Color>[
      const Color(0xffFF7878),
      const Color(0xffFFA959),
      const Color(0xff83DA2D),
      const Color(0xff1FE2D7),
      const Color(0xffC13E6B),
      const Color(0xffFF7878),
      const Color(0xff07B7A6),
      const Color(0xff1F7ACD),
      const Color(0xffBB78FF),
      const Color(0xffF14CD7),
      const Color(0xffFF5757),
    ];

    Random ran = Random.secure();
    return colors[ran.nextInt(10)];
  }
}
