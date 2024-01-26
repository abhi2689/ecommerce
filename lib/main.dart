import 'package:ecommerce/auth/forgot_password.dart';
import 'package:ecommerce/auth/register.dart';
import 'package:ecommerce/auth/sign_inscreen.dart';
import 'package:ecommerce/const/theme_data.dart';
import 'package:ecommerce/provider/product_provider.dart';
import 'package:ecommerce/provider/theme_provider.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/inner/product_details.dart';
import 'package:ecommerce/screens/inner/viewed_recently.dart';
import 'package:ecommerce/screens/inner/wishlist_screen.dart';
import 'package:ecommerce/screens/order_screen.dart';
import 'package:ecommerce/screens/rootScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ProductProvider();
          },
        )
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            routes: {
              ProductDetails.routeName: (context) => const ProductDetails(),
              ViewedRecently.routeName: (context) => const ViewedRecently(),
              WishlistScreen.routeName: (context) => const WishlistScreen(),
              SignInScreen.routeName: (context) => const SignInScreen(),
              RootScreen.routeName: (context) => const RootScreen(),
              OrderScreen.routeName: (context) => const OrderScreen(),
              ForgotPassword.routeName: (context) => const ForgotPassword(),
              RegisterScreen.routeName: (context) => const RegisterScreen()
            },
            debugShowCheckedModeBanner: false,
            home: const RootScreen(),
            theme: Styles.themeData(
                isdarkTheme: value.getDarkTheme, context: context),
          );
        },
      ),
    );
  }
}
