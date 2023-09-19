part of '../import_path.dart';

List<SingleChildWidget> providerList = [
  // theme
  ChangeNotifierProvider(
    create: (_) => ThemeProvider(),
  ),
];
