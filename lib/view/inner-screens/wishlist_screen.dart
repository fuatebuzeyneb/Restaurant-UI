part of '../../import_path.dart';

class WishlistScreen extends StatelessWidget {
  static const routName = 'WishlistScreen';
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlistItems.isEmpty
        ? Scaffold(
            body: EmptyPageWidget(
                imagePath: AppImagesPath.profileAllOrder,
                title: 'Wishlist now is empty',
                subTitle:
                    'hbfjgdlfkjgdfjglkfdjgkldfjgldfkjgdlkfjgdklm,.mvx,.cjiogud'))
        : Scaffold(
            appBar: AppBar(
              title: Text(
                  'Wishlist Screen (${wishlistProvider.getWishlistItems.length})'),
              //Text('Cart Screen'),
              // AppBarTitle(title: 'Cart Screen'),
              actions: [
                IconButton(
                    onPressed: () {
                      DialogWarningFct.showDialogWarning(
                        context: context,
                        subtitle: 'Are you sure??',
                        fct: () {
                          wishlistProvider.clearWishlist();
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
            body: DynamicHeightGridView(
              itemCount: wishlistProvider.getWishlistItems.length,
              crossAxisCount: 2,
              builder: (context, index) {
                return CardProductWidget(
                  productId: wishlistProvider.getWishlistItems.values
                      .toList()[index]
                      .productId,
                  paddingSize: 22,
                  iconSize: 45,
                );
              },
            ),
          );
  }
}
