import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class MyAppFUnction {
  static showErrorOrWarning(
      {required BuildContext context,
      required Function() fct,
      required String subTitle,
      bool isError = false}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                child: Image.asset(
                  isError
                      ? '${AssetManager.imagePath}/error.png'
                      : '${AssetManager.imagePath}/warning.png',
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                child: TitleWidget(text: subTitle),
              ),
              Row(
                mainAxisAlignment: isError
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceEvenly,
                children: [
                  Visibility(
                    visible: !isError,
                    child: IconButton(
                      onPressed: fct,
                      icon: const TitleWidget(
                        text: 'Cancel',
                        fontsize: 16,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: fct,
                    icon: const TitleWidget(
                      text: 'Ok',
                      fontsize: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        );
      },
    );
  }

  static Future<void> imagePickerDialogue(
      {required BuildContext context,
      required Function() cFct,
      required Function() gFct,
      required Function() rFct}) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TitleWidget(text: 'Choose an Option'),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      cFct;
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text('Camera'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      gFct();
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.file_copy_outlined),
                    label: const Text('Gallery'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      rFct();
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Remove'),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
