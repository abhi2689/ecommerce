import 'dart:developer';

import 'package:ecommerce/model/product_model.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/provider/theme_provider.dart';
import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/app_name.dart';
import 'package:ecommerce/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    final ThemeDataa = Provider.of<ThemeProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppNameWidget(),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Image.asset('${AssetManager.bagimagepath}/shopping_cart.png'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    color: Colors.red,
                    onPressed: () {
                      _controller.clear();
                      FocusScope.of(context).unfocus();
                    },
                  ),
                ),
                onChanged: (value) {
                  log('Value is $value');
                },
                onSubmitted: (value) {
                  log('value is $value');
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.builder(
                itemCount: productProvider.products.length,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 200,
                    mainAxisExtent: size.height>= 1000 ? 160 : 160),
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: productProvider.getProducts[index],
                  child: const ProductWidget(),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
