part of '../../import_path.dart';

class LatestArrivalWidget extends StatelessWidget {
  const LatestArrivalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final productModel = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final viewedProvider = Provider.of<ViewedProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 55),
      child: GestureDetector(
        onTap: () async {
          viewedProvider.addProductToHistory(productId: productModel.productId);
          await Navigator.pushNamed(context, ProductDetails.routName,
              arguments: productModel.productId);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: size.height * 0.18,
              width: size.height * 0.17,
              decoration: BoxDecoration(
                color: themeProvider.getIsDarkTheme
                    ? AppColors.darkCardColor
                    : AppColors.lightCardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(75),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 20, bottom: 16, top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      flex: 3,
                      child: Text(
                        productModel.productTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: themeProvider.getIsDarkTheme
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: themeProvider.getIsDarkTheme
                                  ? AppColors.darkPrimaryColor
                                  : AppColors.lightPrimaryColor,
                            ),
                            Text(productModel.productRating,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: themeProvider.getIsDarkTheme
                                      ? Colors.white
                                      : Colors.black,
                                ))
                          ],
                        ),
                        HeartBtnWidget(
                          size: 25,
                          productId: productModel.productId,
                          color: themeProvider.getIsDarkTheme
                              ? AppColors.darkPrimaryColor
                              : AppColors.lightPrimaryColor,
                        )
                      ],
                    ),
                    Text(
                      "\$${productModel.productPrice}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: themeProvider.getIsDarkTheme
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -55,
              left: (size.height * 0.07) / 2,
              child: SizedBox(
                height: size.height * 0.10,
                width: size.height * 0.10,
                child: Image.asset(
                  productModel.productImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 13,
              bottom: 10,
              child: InkWell(
                onTap: () {
                  if (cartProvider.isProductInCart(
                      productId: productModel.productId)) {
                    return;
                  }
                  cartProvider.addProductToCart(
                      productId: productModel.productId, quantity: 1);
                  Fluttertoast.showToast(
                      msg: "The order has been added to the cart",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.red,
                      fontSize: 16.0);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: themeProvider.getIsDarkTheme
                        ? AppColors.darkPrimaryColor
                        : AppColors.lightPrimaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    cartProvider.isProductInCart(
                            productId: productModel.productId)
                        ? Icons.check
                        : Icons.add_shopping_cart_rounded,
                    color: themeProvider.getIsDarkTheme
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
 Container(
                //  padding: const EdgeInsets.symmetric(horizontal: 5),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: themeProvider.getIsDarkTheme
                      ? AppColors.darkPrimaryColor
                      : AppColors.lightPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.add_shopping_cart_rounded,
                  color: themeProvider.getIsDarkTheme
                      ? Colors.black
                      : Colors.white,
                ),
              ),
*/