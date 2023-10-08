part of '../../import_path.dart';

class ProductDetails extends StatefulWidget {
  static const routName = 'ProductDetails';
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final _quantityTextController = TextEditingController(text: '1');
  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final cartProvider = Provider.of<CartProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrProduct = productProvider.findByProdId(productId);
    return Scaffold(
        body: getCurrProduct == null
            ? SizedBox.shrink()
            : Stack(
                children: [
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      color: themeProvider.getIsDarkTheme
                          ? AppColors.darkPrimaryColor
                          : AppColors.lightPrimaryColor,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 130,
                            ),
                            Text(
                              getCurrProduct.productTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: themeProvider.getIsDarkTheme
                                    ? Colors.black
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            IconButton(
                              icon: Icon(Icons.add_shopping_cart_rounded),
                              color: themeProvider.getIsDarkTheme
                                  ? Colors.black
                                  : Colors.white,
                              onPressed: () async {
                                await Navigator.pushNamed(
                                    context, CartScreen.routName);
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          getCurrProduct.productImage,
                          height: 250,
                          width: 250,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 30,
                                  color: themeProvider.getIsDarkTheme
                                      ? AppColors.darkPrimaryColor
                                      : AppColors.lightPrimaryColor,
                                ),
                                Text(getCurrProduct.productRating,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: themeProvider.getIsDarkTheme
                                          ? Colors.white
                                          : Colors.black,
                                    ))
                              ],
                            ),
                            Text(
                              "\$${getCurrProduct.productPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: themeProvider.getIsDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            HeartBtnWidget(
                              size: 30,
                              productId: getCurrProduct.productId,
                              color: themeProvider.getIsDarkTheme
                                  ? Colors.black
                                  : Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _quantityController(
                              fct: () {
                                if (_quantityTextController.text == '1') {
                                  return;
                                } else {
                                  setState(() {
                                    _quantityTextController.text = (int.parse(
                                                _quantityTextController.text) -
                                            1)
                                        .toString();
                                  });
                                }
                              },
                              color: themeProvider.getIsDarkTheme
                                  ? AppColors.darkPrimaryColor
                                  : AppColors.lightPrimaryColor,
                              icon: Icons.remove,
                            ),
                            Flexible(
                              flex: 2,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: themeProvider.getIsDarkTheme
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                controller: _quantityTextController,
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  fillColor: themeProvider.getIsDarkTheme
                                      ? AppColors.darkScaffoldColor
                                      : Colors.white,
                                  filled: true,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'),
                                  ),
                                ],
                                onChanged: (v) {
                                  setState(() {
                                    if (v.isEmpty) {
                                      _quantityTextController.text = '1';
                                    } else {}
                                  });
                                },
                              ),
                            ),
                            _quantityController(
                              fct: () {
                                setState(() {
                                  _quantityTextController.text =
                                      (int.parse(_quantityTextController.text) +
                                              1)
                                          .toString();
                                });
                              },
                              color: themeProvider.getIsDarkTheme
                                  ? AppColors.darkPrimaryColor
                                  : AppColors.lightPrimaryColor,
                              icon: Icons.add,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 80,
                                color: themeProvider.getIsDarkTheme
                                    ? AppColors.darkScaffoldColor
                                    : Colors.white,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    _quantityTextController.text == 1
                                        ? SizedBox()
                                        : Positioned(
                                            left: 00,
                                            child: Image.asset(
                                              getCurrProduct.productImage,
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                    _quantityTextController.text == 1
                                        ? SizedBox()
                                        : Positioned(
                                            left: 30,
                                            child: Image.asset(
                                              getCurrProduct.productImage,
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                    Positioned(
                                      left: 60,
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: themeProvider.getIsDarkTheme
                                              ? AppColors.darkPrimaryColor
                                              : AppColors.lightPrimaryColor,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: Text(
                                          '+${_quantityTextController.text}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: themeProvider.getIsDarkTheme
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Text(
                                        "X" + '${_quantityTextController.text}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: themeProvider.getIsDarkTheme
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: SizedBox(
                            height: 140,
                            child: Column(
                              children: [
                                ButtonWidgetOne(
                                  text: 'Description',
                                  image: Icons.description,
                                  fct: () async {
                                    await showModalBottomSheet(
                                        backgroundColor:
                                            themeProvider.getIsDarkTheme
                                                ? AppColors.darkPrimaryColor
                                                : AppColors.lightPrimaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        )),
                                        context: context,
                                        builder: (context) {
                                          return ProductDescriptionWidget(
                                            productIdd:
                                                getCurrProduct.productId,
                                          );
                                        });
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ButtonWidgetOne(
                                  text: cartProvider.isProductInCart(
                                          productId: getCurrProduct.productId)
                                      ? "In cart"
                                      : "Add to cart",
                                  image: cartProvider.isProductInCart(
                                          productId: getCurrProduct.productId)
                                      ? Icons.check
                                      : Icons.add_shopping_cart_rounded,
                                  fct: () {
                                    if (cartProvider.isProductInCart(
                                        productId: getCurrProduct.productId)) {
                                      return;
                                    }
                                    cartProvider.addProductToCart(
                                        productId: getCurrProduct.productId,
                                        quantity: int.parse(
                                            _quantityTextController.text));
                                    Fluttertoast.showToast(
                                        msg:
                                            "The order has been added to the cart",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.red,
                                        fontSize: 16.0);
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ));
  }

  Widget _quantityController({
    required Function fct,
    required IconData icon,
    required Color color,
  }) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              fct();
            },
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                size: 20,
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height / 1.5);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
