import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant/app_routes.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/products_overview_page.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: "Lato",
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple,
          ),
        ),
        home: const ProductsOverViewPage(),
        routes: {
          AppRoutes.cartPage: (context) => const CartPage(),
        },
      ),
    );
  }
}
