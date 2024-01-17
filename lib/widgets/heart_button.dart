import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({super.key, required this.backgroundColor, this.size = 20});
  final Color backgroundColor;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        style: IconButton.styleFrom(elevation: 10),
        onPressed: () {
          log('Hello');
        },
        icon: Icon(
          IconlyLight.heart,
          size: size,
        ),
      ),
    );
  }
}
