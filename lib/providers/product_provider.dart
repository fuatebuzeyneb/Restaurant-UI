part of '../import_path.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _products;
  }

  ProductModel? findByProdId(String productId) {
    if (_products.where((element) => element.productId == productId).isEmpty) {
      return null;
    }
    return _products.firstWhere((element) => element.productId == productId);
  }

  List<ProductModel> findByCategory({required String ctgName}) {
    List<ProductModel> ctgList = _products
        .where((element) => element.productCategories
            .toLowerCase()
            .contains(ctgName.toLowerCase()))
        .toList();
    return ctgList;
  }

  List<ProductModel> searchQuery(
      {required String searchText, required List<ProductModel> passedList}) {
    List<ProductModel> searchList = passedList
        .where((element) => element.productTitle
            .toLowerCase()
            .contains(searchText.toLowerCase()))
        .toList();
    return searchList;
  }

  final List<ProductModel> _products = [
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Mix Pizza',
        productImage: AppImagesPath.pizza7,
        productCategories: 'pizza',
        productDescription:
            'is an expression that can refer to a combination of different pizza ingredients bundled together in one package. This package will usually contain all the basic ingredients you need to make a pizza at home, such as pre-made pizza crust, tomato sauce, and cheese, and sometimes may include additional toppings such as sausage, olives, peppers, or mushrooms.',
        productPrice: '20.90',
        productRating: '4.8',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Chili Pizza',
        productImage: AppImagesPath.pizza8,
        productCategories: 'pizza',
        productDescription:
            'Chili Pizza is a fusion of two well-loved comfort dishes, combining the essence of delicious pizza with the rich, spicy flavors of Chili.The hallmark of chili pizza is the toppings of the filling. Instead of the usual tomato sauce, our chili pizza is topped with a generous layer of chili mixture.',
        productPrice: '18.90',
        productRating: '4.7',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Onion Pizza',
        productImage: AppImagesPath.pizza12,
        productCategories: 'pizza',
        productDescription:
            'The main ingredient in onion pizza is onions. Onions are cut into thin slices or rings and placed on top of the pizza. Onions give off a distinctive, pleasant flavor and delicious texture when roasted and softened during the baking process. The onions used in the pizza may be red, white, or green onions, depending on personal preference.',
        productPrice: '21.70',
        productRating: '4.6',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Meat Pizza',
        productImage: AppImagesPath.pizza13,
        productCategories: 'pizza',
        productDescription:
            'Meat forms the main part of a meat pizza, and it can contain different types of meat. For example, ground beef (beef, chicken, or lamb) could be the main ingredient. Sausage slices or pepperoni slices can also be added to add extra flavor and texture.',
        productPrice: '25.20',
        productRating: '4.9',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Cheese Pizza',
        productImage: AppImagesPath.pizza15,
        productCategories: 'pizza',
        productDescription:
            'The main ingredient in cheese pizza is cheese, and the types of cheese often used include mozzarella and cheddar cheese. Parmesan, feta, or other types of cheese can also be used, depending on personal preference. Cheese can be grated and spread generously on top of the pizza, resulting in a thick, chewy, melty cheese layer.',
        productPrice: '22.40',
        productRating: '4.8',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Olive Pizza',
        productImage: AppImagesPath.pizza11,
        productCategories: 'pizza',
        productDescription:
            'The main and prominent ingredient in olive pizza is olives. It is topped with a generous amount of sliced ​​olives, which usually come in different colors like green and black. Olives impart a delicious flavor and unique texture to pizza, making it a special experience for olive lovers.',
        productPrice: '16.10',
        productRating: '4.9',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Normal Burger',
        productImage: AppImagesPath.burger1,
        productCategories: 'burger',
        productDescription:
            'The main ingredient in cheese pizza is cheese, and the types of cheese often used include mozzarella and cheddar cheese. Parmesan, feta, or other types of cheese can also be used, depending on personal preference. Cheese can be grated and spread generously on top of the pizza, resulting in a thick, chewy, melty cheese layer.',
        productPrice: '8.20',
        productRating: '4.5',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Small Burger',
        productImage: AppImagesPath.burger2,
        productCategories: 'burger',
        productDescription:
            'The main ingredient in cheese pizza is cheese, and the types of cheese often used include mozzarella and cheddar cheese. Parmesan, feta, or other types of cheese can also be used, depending on personal preference. Cheese can be grated and spread generously on top of the pizza, resulting in a thick, chewy, melty cheese layer.',
        productPrice: '4.90',
        productRating: '4.5',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Chiken Burger',
        productImage: AppImagesPath.burger3,
        productCategories: 'burger',
        productDescription:
            'The main ingredient in cheese pizza is cheese, and the types of cheese often used include mozzarella and cheddar cheese. Parmesan, feta, or other types of cheese can also be used, depending on personal preference. Cheese can be grated and spread generously on top of the pizza, resulting in a thick, chewy, melty cheese layer.',
        productPrice: '6.90',
        productRating: '4.7',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Double Burger',
        productImage: AppImagesPath.burger4,
        productCategories: 'burger',
        productDescription:
            'The main ingredient in cheese pizza is cheese, and the types of cheese often used include mozzarella and cheddar cheese. Parmesan, feta, or other types of cheese can also be used, depending on personal preference. Cheese can be grated and spread generously on top of the pizza, resulting in a thick, chewy, melty cheese layer.',
        productPrice: '11.20',
        productRating: '4.53',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Cheese Burger',
        productImage: AppImagesPath.burger5,
        productCategories: 'burger',
        productDescription:
            'The main ingredient in cheese pizza is cheese, and the types of cheese often used include mozzarella and cheddar cheese. Parmesan, feta, or other types of cheese can also be used, depending on personal preference. Cheese can be grated and spread generously on top of the pizza, resulting in a thick, chewy, melty cheese layer.',
        productPrice: '9.75',
        productRating: '4.9',
        productQuantity: '12'),
    ProductModel(
        productId: Uuid().v4(),
        productTitle: 'Treble Burger',
        productImage: AppImagesPath.burger6,
        productCategories: 'burger',
        productDescription:
            'The main ingredient in cheese pizza is cheese, and the types of cheese often used include mozzarella and cheddar cheese. Parmesan, feta, or other types of cheese can also be used, depending on personal preference. Cheese can be grated and spread generously on top of the pizza, resulting in a thick, chewy, melty cheese layer.',
        productPrice: '14.20',
        productRating: '4.8',
        productQuantity: '12'),
  ];
}
