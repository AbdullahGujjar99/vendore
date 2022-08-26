import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widget/MapDetailWidget.dart';
import '../AppColors.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    Key? key,
    required this.text,
    required this.color,
    required this.ontab,
  }) : super(key: key);
  final String text;
  final Color color;
  final Function() ontab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        height: 67,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Center(
          child: Text('$text',
            style: TextStyle(fontFamily: 'poppins', fontSize: 16, color: AppColors.kWhite, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}