part of '../../import_path.dart';

class ProductDescriptionWidget extends StatelessWidget {
  final String productIdd;
  const ProductDescriptionWidget({
    super.key,
    required this.productIdd,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    final getCurrProduct = productProvider.findByProdId(productIdd);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 6,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color:
                    themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              getCurrProduct!.productDescription,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color:
                    themeProvider.getIsDarkTheme ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
