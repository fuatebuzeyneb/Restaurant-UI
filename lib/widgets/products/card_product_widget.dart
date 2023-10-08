part of '../../import_path.dart';

class CardProductWidget extends StatefulWidget {
  const CardProductWidget(
      {super.key,
      required this.paddingSize,
      required this.iconSize,
      required this.productId});
  final double paddingSize;
  final double iconSize;
  final String productId;
  @override
  State<CardProductWidget> createState() => _CardProductWidgetState();
}

class _CardProductWidgetState extends State<CardProductWidget> {
  @override
  Widget build(BuildContext context) {
    // final productModelProvider = Provider.of<ProductModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productProvider.findByProdId(widget.productId);
    Size size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final viewedProvider = Provider.of<ViewedProvider>(context);
    return getCurrProduct == null
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.only(
                left: widget.paddingSize, right: widget.paddingSize, top: 85),
            child: GestureDetector(
              onTap: () async {
                viewedProvider.addProductToHistory(
                    productId: getCurrProduct.productId);
                await Navigator.pushNamed(context, ProductDetails.routName,
                    arguments: getCurrProduct.productId);
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
                              getCurrProduct.productTitle,
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
                                  Text(getCurrProduct.productRating,
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
                                productId: getCurrProduct.productId,
                                color: themeProvider.getIsDarkTheme
                                    ? AppColors.darkPrimaryColor
                                    : AppColors.lightPrimaryColor,
                              )
                            ],
                          ),
                          Text(
                            "\$${getCurrProduct.productPrice}",
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
                    top: -65,
                    left: (size.height * 0.07) / 2,
                    child: SizedBox(
                      height: size.height * 0.10,
                      width: size.height * 0.10,
                      child: Image.asset(
                        getCurrProduct.productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 13,
                    bottom: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        if (cartProvider.isProductInCart(
                            productId: getCurrProduct.productId)) {
                          return;
                        }
                        cartProvider.addProductToCart(
                            productId: getCurrProduct.productId, quantity: 1);
                        Fluttertoast.showToast(
                            msg: "The order has been added to the cart",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            textColor: Colors.red,
                            fontSize: 16.0);
                      },
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: themeProvider.getIsDarkTheme
                              ? AppColors.darkPrimaryColor
                              : AppColors.lightPrimaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          cartProvider.isProductInCart(
                                  productId: getCurrProduct.productId)
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
