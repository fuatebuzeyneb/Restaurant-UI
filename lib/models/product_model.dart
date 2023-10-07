part of '../import_path.dart';

class ProductModel with ChangeNotifier {
  String productId,
      productTitle,
      productDescription,
      productCategories,
      productQuantity,
      productImage,
      productPrice,
      productRating;

  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productImage,
    required this.productCategories,
    required this.productDescription,
    required this.productPrice,
    required this.productRating,
    required this.productQuantity,
  });
}
