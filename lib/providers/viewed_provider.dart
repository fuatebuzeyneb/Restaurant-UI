part of '../import_path.dart';

class ViewedProvider with ChangeNotifier {
  final Map<String, ViewedModel> _viewedItems = {};
  Map<String, ViewedModel> get getViewedItems {
    return _viewedItems;
  }

  void addProductToHistory({required String productId}) {
    _viewedItems.putIfAbsent(
      productId,
      () => ViewedModel(
        id: const Uuid().v4(),
        productId: productId,
      ),
    );

    notifyListeners();
  }
}
