import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/cart_bottomWidget.dart';
import 'package:ecommerce/widgets/cart_widget.dart';
import 'package:ecommerce/widgets/custom_cart_widget.dart';
import 'package:ecommerce/widgets/product_widget.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  final bool isEmpty = true;
  static const routeName = '/WishList';
  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0,),
            body: CustomCartWidget(
              imagePath: '${AssetManager.bagimagepath}/shopping_basket.png',
              title: 'No Product Yet',
              subtitle:
                  'Looks like your cart is empty! add something to make me happy',
              buttonText: 'Shop now',
            ),
          )
        : Scaffold(
            appBar: AppBar(

              title: const TitleWidget(text: "WishList"),
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
