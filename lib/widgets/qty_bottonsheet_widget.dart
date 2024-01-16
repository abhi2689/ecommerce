import 'dart:developer';

import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:flutter/material.dart';

class QtyBottomSheet extends StatelessWidget {
  const QtyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 6,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  log('$index');
                },
                child: Center(
                  child: Subtitletext(text: '${index + 1}'),
                ),
              );
            },
            itemCount: 25,
          ),
        ),
      ],
    );
  }
}
