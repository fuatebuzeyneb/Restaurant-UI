part of '../import_path.dart';

List<SingleChildWidget> providerList = [
  // theme
  ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => ProductProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => CartProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => WishlistProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => ViewedProvider(),
  ),
];
