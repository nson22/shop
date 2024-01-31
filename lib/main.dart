import 'package:flutter/material.dart';
import 'package:shop/pages/product_list_page.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Lato",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
        ),
      ),
      home: ProductListPage(),
    );
  }
}
