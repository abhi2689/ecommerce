import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class CustomCartWidget extends StatelessWidget {
  const CustomCartWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });
  final String imagePath;
  final String title;
  final String subtitle;
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            imagePath,
            width: size.width,
            height: size.height * .35,
          ),
          const SizedBox(
            height: 10,
          ),
          const TitleWidget(
            text: 'Whoops',
            color: Colors.red,
          ),
          const SizedBox(
            height: 20,
          ),
          Subtitletext(
            text: title,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Subtitletext(
              fontsize: 15,
              text: subtitle,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.blue,
                elevation: 0),
            child: Text(buttonText),
          )
        ],
      ),
    );
  }
}
