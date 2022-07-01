import 'package:ecommerce_tarek_alabd/utilities/images.dart';

class Product {
  final String? id;
  final String? name;
  final String category;
  final int? price;
  final int? discount;
  final String? imageUrl;
  final double? rating;

  Product({
    required this.id,
    required this.name,
    this.category = 'ملابس',
    required this.price,
    this.discount,
    required this.imageUrl,
    this.rating,
  });
}

List<Product> dummyProducts = [
  Product(
    id: "1",
    name: "t-shirt",
    price: 100,
    discount: 20,
    imageUrl: AppImages.listImages[0],
  ),
  Product(
    id: "1",
    name: "t-shirt",
    price: 100,
    discount: 20,
    imageUrl: AppImages.listImages[0],
  ),
  Product(
    id: "1",
    name: "t-shirt",
    price: 100,
    discount: 20,
    imageUrl: AppImages.listImages[0],
  ),
];
