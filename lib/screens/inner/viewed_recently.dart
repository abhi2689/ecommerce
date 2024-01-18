import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/cart_bottomWidget.dart';
import 'package:ecommerce/widgets/cart_widget.dart';
import 'package:ecommerce/widgets/custom_cart_widget.dart';
import 'package:ecommerce/widgets/product_widget.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ViewedRecently extends StatelessWidget {
  const ViewedRecently({super.key});
  final bool isEmpty = false;
  static const routeName = '/viewedRecently';
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: CustomCartWidget(
              imagePath: '${AssetManager.bagimagepath}/shopping_basket.png',
              title: 'No Viewed Product Yet',
              subtitle:
                  'Looks like your cart is empty! add something to make me happy',
              buttonText: 'Shop now',
            ),
          )
        : Scaffold(
            appBar: AppBar(

              title: const TitleWidget(text: "Cart(6)"),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyBold.delete,
                  ),
                )
              ],
            ),
            body: GridView.builder(
              itemBuilder: (context, index) => const ProductWidget(),
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            ),
          );
  }
}
