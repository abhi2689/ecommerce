
import 'package:ecommerce/const/app_constants.dart';
import 'package:ecommerce/widgets/app_name.dart';
import 'package:ecommerce/widgets/heart_button.dart';
import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static const routeName = '/details';
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppNameWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                imageUrl: AppConstants.newImageURL,
                width: double.infinity,
                height: size.height * .38,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Title' * 10,
                          softWrap: true,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const Subtitletext(
                        text: '\$1500',
                        color: Colors.blue,
                        fontsize: 20,
                        fontWeight: FontWeight.w600,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HeartButton(
                          backgroundColor: Colors.blue.shade200,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shopping_cart,
                            ),
                            label: const Text(
                              'Add to Cart',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleWidget(
                        text: 'About this item',
                      ),
                      TitleWidget(
                        text: 'In Phone',
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Subtitletext(
                    text: 'Description' * 100,
                    fontsize: 16,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
