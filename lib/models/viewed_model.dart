part of '../import_path.dart';

class ViewedModel with ChangeNotifier {
  final String id;
  final String productId;

  ViewedModel({
    required this.id,
    required this.productId,
  });
}
