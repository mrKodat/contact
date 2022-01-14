import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  LeftBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff223E6D),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              child: Align(
                  widthFactor: 1,
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xffFEB25B),
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )))
        ],
      ),
    );
  }
}
