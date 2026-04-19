import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_cart_riverpod/model.dart';

class ProductBody extends ConsumerWidget {
  const ProductBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(getProductsProvider);
    return Center(
      child: switch (products) {
        AsyncData(:final value) => GridView.builder(
          padding: EdgeInsets.all(20.0),
          scrollDirection: Axis.vertical,
          itemCount: value.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(
                        value[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      value[index].title,
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                    Text(
                      '\$${value[index].price}',
                      style: const TextStyle(fontSize: 14),
                    ),

                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add to Cart'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
