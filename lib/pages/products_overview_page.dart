import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constant/app_routes.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product_list.dart';

import '../components/product_grid.dart';

enum FavoriteOptions { all, favorites }

class ProductsOverViewPage extends StatelessWidget {
  const ProductsOverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Minha loja"),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FavoriteOptions.favorites,
                child: Text("Somente favoritos"),
              ),
              const PopupMenuItem(
                value: FavoriteOptions.all,
                child: Text("Todos"),
              ),
            ],
            onSelected: (FavoriteOptions option) => {
              if (option == FavoriteOptions.favorites)
                {productList.showFavoritOnly()}
              else
                {productList.showAll()}
            },
          ),
          Consumer<Cart>(
            builder: (context, cart, child) => Badge.count(
              count: cart.itemsCount,
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.cartPage);
                },
              ),
            ),
          )
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
