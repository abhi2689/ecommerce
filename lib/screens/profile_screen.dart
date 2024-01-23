import 'package:ecommerce/provider/theme_provider.dart';
import 'package:ecommerce/screens/inner/viewed_recently.dart';
import 'package:ecommerce/screens/inner/wishlist_screen.dart';
import 'package:ecommerce/services/assetManager.dart';
import 'package:ecommerce/widgets/app_name.dart';
import 'package:ecommerce/widgets/subtitle_test.dart';
import 'package:ecommerce/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/services/myAppFunction.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  get label => null;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AppNameWidget(),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('${AssetManager.bagimagepath}/shopping_cart.png'),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Visibility(
                  visible: false,
                  child: TitleWidget(
                      maxlines: 2,
                      text: "Please login to have unlimited access"),
                ),
              ),
              Visibility(
                visible: true,
                child: IntrinsicWidth(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: FittedBox(
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.background,
                                  width: 3),
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleWidget(text: 'Abhidev d'),
                              SizedBox(
                                height: 5,
                              ),
                              Subtitletext(
                                text: 'Abhidevddev@gmail.com',
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TitleWidget(text: 'General'),
                  ],
                ),
              ),
              CustomListTile(
                  text: 'All Orders',
                  image: '${AssetManager.profileImagePath}/address.png',
                  icon: IconlyBold.arrowRight,
                  fc: () {}),
              CustomListTile(
                  text: 'WishList',
                  image: '${AssetManager.bagimagepath}/wishlist_svg.png',
                  icon: IconlyBold.arrowRight,
                  fc: () {
                    Navigator.pushNamed(context, WishlistScreen.routeName);
                  }),
              CustomListTile(
                  text: 'Viewed recently',
                  image: '${AssetManager.profileImagePath}/recent.png',
                  icon: IconlyBold.arrowRight,
                  fc: () {
                    Navigator.pushNamed(context, ViewedRecently.routeName);
                  }),
              CustomListTile(
                  text: 'Address',
                  image: '${AssetManager.bagimagepath}/order_svg.png',
                  icon: IconlyBold.arrowRight,
                  fc: () {}),
              const Divider(),
              const TitleWidget(text: 'Settings'),
              SwitchListTile(
                secondary: Image.asset(
                  '${AssetManager.profileImagePath}/theme.png',
                  height: 34,
                ),
                title: Text(
                    themeProvider.getDarkTheme ? 'Dark Mode' : 'Light mode'),
                value: themeProvider.getDarkTheme,
                onChanged: (value) {
                  themeProvider.setdarkTheme(value);
                },
              ),
              const Divider(),
              Center(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    MyAppFUnction.showErrorOrWarning(
                        context: context,
                        isError: false,
                        fct:  (){Navigator.pop(context);},
                        subTitle: 'Are you sure want to Signout');
                  },
                  icon: const Icon(Icons.login),
                  label: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    required this.image,
    required this.icon,
    required this.fc,
  });
  final String text;
  final String image;
  final IconData icon;
  final Function() fc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Image.asset(
        image,
        height: 34,
      ),
      trailing: Icon(icon),
      onTap: fc,
    );
  }
}
