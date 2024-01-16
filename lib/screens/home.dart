import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce/const/app_constants.dart';
import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/category_rounded_widget.dart';
import 'package:ecommerce/widgets/latest_arrival.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    child: Swiper(autoplay: true,
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
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const LatestArriavalWidget();
                    },
                  ),
                ),const SizedBox(
                  height: 15,
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: TitleWidget(text: "Categories"),
                ),const SizedBox(
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
