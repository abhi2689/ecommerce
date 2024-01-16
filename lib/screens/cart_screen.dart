import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/cart_bottomWidget.dart';
import 'package:ecommerce/widgets/cart_widget.dart';
import 'package:ecommerce/widgets/custom_cart_widget.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEMpty = false;
  @override
  Widget build(BuildContext context) {
    return isEMpty
        ? Scaffold(
            body: CustomCartWidget(
              imagePath: '${AssetManager.bagimagepath}/shopping_basket.png',
              title: 'Your cart is empty',
              subtitle:
                  'Look like your cart is empty add something to make me happy',
              buttonText: 'Shop now',
            ),
          )
        : Scaffold(
            bottomSheet: const CartBottomWidget(),
            appBar: AppBar(
              leading:
                  Image.asset('${AssetManager.bagimagepath}/shopping_cart.png'),
              title: const TitleWidget(text: "Cart(6)"),
              elevation: 0,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyBold.delete,
                    ))
              ],
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => const CartWidget(),
              itemCount: 5,
            ),
          );
  }
}
