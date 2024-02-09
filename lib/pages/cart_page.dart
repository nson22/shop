import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: Card(
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total"),
              const SizedBox(
                width: 10,
              ),
              Chip(
                shape: const StadiumBorder(),
                label: Text("R\$ ${cart.totalAmount().toString()}"),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text("COMPRAR"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
