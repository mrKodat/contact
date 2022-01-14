import 'package:flutter/material.dart';

class LeftBar extends StatelessWidget {
  LeftBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff223E6D),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    );
  }
}
