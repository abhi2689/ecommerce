import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:flutter/material.dart';

class CategoryRoundedWidget extends StatelessWidget {
  const CategoryRoundedWidget(
      {super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Image.asset(
            image,
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        FittedBox(
          child: Subtitletext(
            text: name,
            fontsize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
