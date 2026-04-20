import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'model.g.dart';

final dio = Dio();

@riverpod
Future<List<Product>> getProducts(Ref ref) async {
  final response = await dio.get('https://fakestoreapi.com/products');
  return (response.data as List)
      .map((item) => Product.fromJson(item as Map<String, dynamic>))
      .toList();
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
    );
  }

  final int id;
  final String title;
  final double price;
  final String image;
}

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  List<Product> build() {
    return [];
  }

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }
}
