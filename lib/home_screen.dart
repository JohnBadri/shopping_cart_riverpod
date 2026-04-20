import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_riverpod/cart_page.dart';
import 'package:shopping_cart_riverpod/product_body.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('John\'s Shopping Store'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            icon: Icon(Icons.shopping_cart_checkout),
            tooltip: 'Opens shopping cart',
          ),
        ],
      ),
      body: ProductBody(),
    );
  }
}
