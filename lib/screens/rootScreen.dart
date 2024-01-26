import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/profile_screen.dart';
import 'package:ecommerce/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});
static const routeName = '/RootScreen';
  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late List<Widget> screens;
  late PageController controller;
  int currentScreen = 2;

  @override
  void initState() {
    screens = const [
      HomeScreen(),
      SearchScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    controller = PageController(
      initialPage: currentScreen,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
        height: kBottomNavigationBarHeight,
        onDestinationSelected: (value) {
          setState(() {
            currentScreen = value;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              IconlyLight.home,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              IconlyLight.search,
            ),
            label: 'Search',
          ),
          NavigationDestination(
            label: 'Cart',
            icon: Badge(
              label: Text('5'),
              child: Icon(
                IconlyLight.bag2,
              ),
            ),
          ),
          NavigationDestination(
            icon: Icon(
              IconlyLight.profile,
            ),
            label: 'profile',
          )
        ],
        selectedIndex: currentScreen,
      ),
    );
  }
}
