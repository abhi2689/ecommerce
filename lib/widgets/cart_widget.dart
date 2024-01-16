import 'package:ecommerce/widgets/qty_bottonsheet_widget.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IntrinsicWidth(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: FancyShimmerImage(
                    height: size.height * .2,
                    width: size.height * .2,
                    imageUrl:
                        'https://media.istockphoto.com/id/1339055637/photo/back-to-school-background-stationery-supplies-in-the-school-bag-banner-design-education-on.jpg?s=2048x2048&w=is&k=20&c=JG5XaxXCixtBxAhmQ9Y3iarLwVSCz-WCqeDGUiwsi9A='),
              ),
              const SizedBox(
                width: 5,
              ),
              IntrinsicWidth(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * .6,
                          child: TitleWidget(
                            text: 'Title' * 10,
                            maxlines: 2,
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                IconlyLight.heart,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TitleWidget(text: '\$65'),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await showModalBottomSheet(
                              context: context,
                              builder: (context) => const QtyBottomSheet(),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            IconlyLight.arrowDown2,
                          ),
                          label: const Text('Qty 3'),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
