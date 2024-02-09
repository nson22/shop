import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(
      context,
      listen: false,
    );
    final cart = Provider.of<Cart>(
      context,
      listen: false,
    );

    return GridTile(
      footer: GridTileBar(
        leading: Consumer<Product>(
          builder: (ctx, product, _) => IconButton(
            color: Theme.of(context).colorScheme.error,
            icon: product.isFavorite
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            onPressed: () {
              product.toggleFavorite();
            },
          ),
        ),
        backgroundColor: Colors.black54,
        title: Text(
          textAlign: TextAlign.center,
          product.name,
        ),
        trailing: IconButton(
          color: Theme.of(context).primaryColorLight,
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            cart.addItem(product);
          },
        ),
      ),
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
