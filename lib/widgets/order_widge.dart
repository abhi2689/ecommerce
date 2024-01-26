import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            AssetManager.mobiles,
            height: size.width / 5,
            width: size.width / 5,
          ),
        ),
        const Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleWidget(
                text: 'Product Title',
                fontsize: 18,
              ),
              FittedBox(
                child: Row(
                  children: [
                    Subtitletext(
                      text: 'Price',
                      fontsize: 15,
                    ),
                    Subtitletext(
                      text: '\$1500',
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
              Subtitletext(
                text: 'Qty: 10',
                fontsize: 15,
              )
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ))
      ],
    );
  }
}
