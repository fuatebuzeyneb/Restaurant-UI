part of '../../import_path.dart';

class CartWidget extends StatefulWidget {
  final int q;
  const CartWidget({super.key, required this.q});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = widget.q.toString();
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final cartModelProvider = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct =
        productProvider.findByProdId(cartModelProvider.productId);
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return getCurrProduct == null
        ? SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 150,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  // Those are our background
                  Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: themeProvider.getIsDarkTheme
                          ? AppColors.darkPrimaryColor
                          : AppColors.lightPrimaryColor,
                    ),
                    child: Container(
                      margin: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: themeProvider.getIsDarkTheme
                            ? AppColors.darkCardColor
                            : AppColors.lightCardColor,
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                  ),

                  // Product title and price
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SizedBox(
                      height: 150,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 43,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Text(
                              getCurrProduct.productTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: themeProvider.getIsDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: size.width * 0.33,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                _quantityController(
                                  fct: () {
                                    if (_quantityTextController.text == '1') {
                                      return;
                                    } else {
                                      cartProvider.reduceQuantityByOne(
                                          getCurrProduct.productId);
                                      setState(
                                        () {
                                          _quantityTextController.text =
                                              (int.parse(_quantityTextController
                                                          .text) -
                                                      1)
                                                  .toString();
                                        },
                                      );
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
                                          ? AppColors.lightCardColor
                                          : AppColors.darkCardColor,
                                    ),
                                    controller: _quantityTextController,
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      fillColor: themeProvider.getIsDarkTheme
                                          ? AppColors.darkCardColor
                                          : AppColors.lightCardColor,
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
                                        } else {
                                          return;
                                        }
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                _quantityController(
                                  fct: () {
                                    cartProvider.increaseQuantityByOne(
                                        getCurrProduct.productId);
                                    setState(() {
                                      _quantityTextController.text = (int.parse(
                                                  _quantityTextController
                                                      .text) +
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
                          ),

                          // it use the available space
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30, // 30 padding
                              vertical: 8 / 4, // 5 top and bottom
                            ),
                            decoration: BoxDecoration(
                              color: themeProvider.getIsDarkTheme
                                  ? AppColors.darkPrimaryColor
                                  : AppColors.lightPrimaryColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(22),
                                topLeft: Radius.circular(22),
                              ),
                            ),
                            child: Text(
                              "\$${getCurrProduct.productPrice}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: themeProvider.getIsDarkTheme
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -8,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      height: 120,
                      width: 180,
                      child: Image.asset(
                        getCurrProduct.productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        cartProvider.removeOneItem(getCurrProduct.productId);
                      },
                      child: Container(
                        //  padding: const EdgeInsets.symmetric(horizontal: 5),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: themeProvider.getIsDarkTheme
                              ? AppColors.darkPrimaryColor
                              : AppColors.lightPrimaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.delete,
                          color: themeProvider.getIsDarkTheme
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 45,
                    child: Container(
                      //  padding: const EdgeInsets.symmetric(horizontal: 5),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: themeProvider.getIsDarkTheme
                            ? AppColors.darkPrimaryColor
                            : AppColors.lightPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: HeartBtnWidget(
                        size: 25,
                        productId: getCurrProduct.productId,
                        color: themeProvider.getIsDarkTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
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
                size: 15,
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
