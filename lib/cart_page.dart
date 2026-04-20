import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_riverpod/model.dart';

class CartPage extends ConsumerWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            for (final product in cartItems)
              ListTile(
                leading: Image.network(product.image),
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    ref.read(cartProvider.notifier).removeProduct(product);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
