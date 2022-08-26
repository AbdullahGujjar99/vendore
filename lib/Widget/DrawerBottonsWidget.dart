import 'package:flutter/material.dart';

import '../AppColors.dart';

class DrawerButtonsWidget extends StatelessWidget {
  DrawerButtonsWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.onpress,

  }) : super(key: key);
  final String icon;
  final String text;
  final Function() onpress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('$icon'),
      title: Text('$text',
          style: TextStyle(fontFamily: 'poppins',fontSize: 14, color: AppColors.kBlackDrawer, fontWeight: FontWeight.w700)),
      onTap: onpress
    );
  }
}