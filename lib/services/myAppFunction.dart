import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class MyAppFUnction {
  static showErrorOrWarning(
      {required BuildContext context,
      required Function fct,required String subTitle,
      bool isError = false}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
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
                ),TitleWidget(text: subTitle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: !isError,
                      child: IconButton(
                        onPressed: () {},
                        icon: const TitleWidget(
                          text: 'Cancel',
                          fontsize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
        });
  }
}
