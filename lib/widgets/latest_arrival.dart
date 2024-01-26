import 'package:ecommerce/const/app_constants.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/screens/inner/product_details.dart';
import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class LatestArriavalWidget extends StatelessWidget {
  const LatestArriavalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, ProductDetails.routeName);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.1),
              border: Border.all(width: 1, color: Theme.of(context).cardColor), borderRadius: BorderRadius.circular(12),),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl:
                        productModel.productImage ?? AppConstants.newImageURL,
                    height: size.height * .21,
                    width: size.height * .21,boxFit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TitleWidget(
                        text: productModel.productTitle ?? 'Title' * 10,
                        maxlines: 2,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          onPressed: () {},
                          icon: const Icon(
                            IconlyLight.heart,
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                          ),
                        )
                      ],
                    ),
                    FittedBox(
                      child: Subtitletext(
                        text: productModel.productPrice ?? '\$1500',
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
