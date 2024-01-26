import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/custom_cart_widget.dart';
import 'package:ecommerce/widgets/order_widge.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  static const routeName = '/OrderScreen';

 final  bool isEmpty= true;
  @override
  Widget build(BuildContext context) {
    return isEmpty? Scaffold(appBar: AppBar(),body: CustomCartWidget(
      imagePath: '${AssetManager.bagimagepath}/shopping_basket.png',
      title: 'No Orders Yet',
      subtitle:
      'Looks like you have not ordered anything! add something to make me happy',
      buttonText: 'Shop now',
    ),): Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) => const OrderWidget(),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
