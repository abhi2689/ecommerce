import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce/const/app_constants.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/widgets/category_rounded_widget.dart';
import 'package:ecommerce/widgets/latest_arrival.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Swiper(
                      autoplay: true,
                      itemCount: AppConstants.bannerImage.length,
                      pagination: const SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                        color: Colors.yellow,
                        activeColor: Colors.blue,
                      )),
                      itemBuilder: (context, index) {
                        return Image.asset(
                          AppConstants.bannerImage[index],
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: TitleWidget(text: "Latest Arrival"),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: size.height * .25,
                  child: ListView.builder(
                    itemExtent: 200,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: productProvider.getProducts.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: productProvider.getProducts[index],
                        child: const LatestArriavalWidget(),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: TitleWidget(text: "Categories"),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    children: List.generate(
                      AppConstants.categoriesList.length,
                      (index) => CategoryRoundedWidget(
                          image: AppConstants.categoriesList[index].image,
                          name: AppConstants.categoriesList[index].name),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
