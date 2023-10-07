part of '../import_path.dart';

class AppConstans {
  static const List<String> banners = [
    AppImagesPath.banner1,
    AppImagesPath.banner2,
    AppImagesPath.banner3
  ];

  static List<CategoryModel> categoriesList = [
    CategoryModel(id: '1', name: 'Pizza', image: AppImagesPath.pizza),
    CategoryModel(id: '2', name: 'Burger', image: AppImagesPath.burger1),
    CategoryModel(id: '3', name: 'Sushi', image: AppImagesPath.sushi),
    CategoryModel(id: '4', name: 'Taco', image: AppImagesPath.taco),
    CategoryModel(id: '5', name: 'Pasta', image: AppImagesPath.pasta),
    CategoryModel(id: '6', name: 'Cupcake', image: AppImagesPath.cupcake),
    CategoryModel(id: '7', name: 'Fries', image: AppImagesPath.fries),
    CategoryModel(id: '8', name: 'Drink', image: AppImagesPath.drink),
  ];
}
