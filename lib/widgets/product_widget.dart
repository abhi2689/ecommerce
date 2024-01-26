import 'package:ecommerce/const/app_constants.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/screens/inner/product_details.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productModelProvider = Provider.of<ProductModel>(context);
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductDetails(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(.1),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 1, color: Theme.of(context).cardColor)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: productModelProvider.productImage ??
                    AppConstants.newImageURL,
                height: size.height * .1,
                width: size.width * .21,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: TitleWidget(
                    text: productModelProvider.productTitle ?? 'Title' * 10,
                    maxlines: 2,
                    fontsize: 14,
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      IconlyLight.heart,
                      size: 20,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: TitleWidget(
                    text: productModelProvider.productPrice ?? '\$1550',
                    fontsize: 14,
                  ),
                ),
                Flexible(
                  child: Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
