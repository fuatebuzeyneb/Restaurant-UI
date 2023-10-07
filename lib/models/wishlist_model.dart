part of '../import_path.dart';

class WishlistModel with ChangeNotifier {
  final String id;
  final String productId;

  WishlistModel({
    required this.id,
    required this.productId,
  });
}
