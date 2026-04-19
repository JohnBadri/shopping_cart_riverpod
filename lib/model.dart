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
    required this.category,
    required this.image,
    required this.rating,
    required this.reviewCount,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
      image: json['image'] as String,
      rating: (json['rating']['rate'] as num).toDouble(),
      reviewCount: json['rating']['count'] as int,
    );
  }

  final int id;
  final String title;
  final double price;
  final String category;
  final String image;
  final double rating;
  final int reviewCount;
}
