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
        AsyncData(:final value) => Text(value.length.toString()),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
