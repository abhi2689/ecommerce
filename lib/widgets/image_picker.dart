import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key, this.pickedImage, required this.fct});
  final XFile? pickedImage;
  final Function() fct;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: pickedImage == null
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                )
              : Image.file(
                  File(
                    pickedImage!.path,
                  ),
                  fit: BoxFit.fill,
                ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            child: InkWell(
              onTap: fct,
              child: const Icon(Icons.add_shopping_cart_outlined),
            ),
          ),
        )
      ],
    );
  }
}
