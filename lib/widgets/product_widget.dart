
import 'package:ecommerce/const/app_constants.dart';
import 'package:ecommerce/screens/inner/product_details.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(3),
      child: GestureDetector(onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductDetails(),),);
      },
        child: Column(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl: AppConstants.newImageURL,
                  height: size.width*21,
                  width: double.infinity,
                ),
              ),
            ),const SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: TitleWidget(text: 'Title' * 10,maxlines: 2,fontsize: 16,),
                ),
                Flexible(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      IconlyLight.heart,
                    ),
                  ),
                )
              ],
            ),const SizedBox(height: 5,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  flex: 1,
                  child: TitleWidget(
                    text: '\$1550',fontsize: 14,
                  ),
                ),
                Flexible(
                  child: Material(color: Colors.blue,borderRadius: BorderRadius.circular(15),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                      ),
                    ),
                  ),
                ),
              ],
            ),const SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
