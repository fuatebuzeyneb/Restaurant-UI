part of '../../import_path.dart';

class CartScreen extends StatelessWidget {
  static const routName = 'CartScreen';
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      bottomSheet: const BottomCheckout(),
      appBar: AppBar(
        title: Text(
          'Cart Screen (${cartProvider.getCartItems.length})',
          style: TextStyle(
              color: themeProvider.getIsDarkTheme ? Colors.white : Colors.black,
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightScaffoldColor,
        //Text('Cart Screen'),
        // AppBarTitle(title: 'Cart Screen'),
        actions: [
          IconButton(
              onPressed: () {
                DialogWarningFct.showDialogWarning(
                  context: context,
                  subtitle: 'Are you sure??',
                  fct: () async {
                    cartProvider.clearCart();
                  },
                  isError: false,
                );
              },
              icon: Icon(
                Icons.delete,
                color: themeProvider.getIsDarkTheme
                    ? AppColors.darkPrimaryColor
                    : AppColors.lightPrimaryColor,
              ))
        ],
      ),
      body: cartProvider.getCartItems.isEmpty
          ? EmptyPageWidget(
              imagePath: AppImagesPath.profileAllOrder,
              title: 'Cart now is empty',
              subTitle: 'Take a look at our delicious recipes and dishes')
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.getCartItems.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItems.values
                            .toList()
                            .reversed
                            .toList()[index],
                        child: CartWidget(
                            q: cartProvider.getCartItems.values
                                .toList()[index]
                                .quantity),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: kBottomNavigationBarHeight + 55,
                )
              ],
            ),
    );
  }
}
