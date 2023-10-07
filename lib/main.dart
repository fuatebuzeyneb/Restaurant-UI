import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_user/import_path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerList,
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Restaurant',
          theme: Styles.themeData(
              isDarkTheme: themeProvider.getIsDarkTheme, context: context),
          home: const SplashScreen(),
          routes: {
            ProductDetails.routName: (context) => ProductDetails(),
            WishlistScreen.routName: (context) => const WishlistScreen(),
            ViewedScreen.routName: (context) => const ViewedScreen(),
            LoginScreen.routName: (context) => const LoginScreen(),
            RegisterScreen.routName: (context) => const RegisterScreen(),
            OrderScreen.routName: (context) => const OrderScreen(),
            ForgotScreen.routName: (context) => const ForgotScreen(),
            SearchScreen.routName: (context) => const SearchScreen(),
          },
          // routes: ,
        );
      }),
    );
  }
}
