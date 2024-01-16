import 'package:flutter/material.dart';

class Subtitletext extends StatelessWidget {
  const Subtitletext(
      {super.key,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.decoration = TextDecoration.none,
      this.color,
      this.fontsize = 20,
      this.fontStyle = FontStyle.normal});
  final String text;
  final FontWeight fontWeight;
  final TextDecoration decoration;
  final Color? color;
  final double fontsize;
  final FontStyle fontStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: fontsize,
          decoration: decoration,
          fontStyle: FontStyle.normal),
    );
  }
}
