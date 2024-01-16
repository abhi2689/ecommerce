import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: const TitleWidget(text: 'ShopSmart'),
    );
  }
}
