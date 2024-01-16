import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget(
      {super.key,
      required this.text,
      this.fontWeight = FontWeight.bold,
      this.color,
      this.fontsize = 20,
      this.fontStyle = FontStyle.normal,
      this.maxlines = 1});
  final String text;
  final FontWeight fontWeight;
  final Color? color;
  final double fontsize;
  final FontStyle fontStyle;
  final int? maxlines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxlines,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontsize,
          overflow: TextOverflow.ellipsis),
    );
  }
}
