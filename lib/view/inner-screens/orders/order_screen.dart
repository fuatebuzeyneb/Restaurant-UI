part of '../../../import_path.dart';

class OrderScreen extends StatelessWidget {
  static const routName = 'OrderScreen';
  const OrderScreen({super.key});

  final bool isEmptyOrders = false;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Screen'),
        //Text('Cart Screen'),
        // AppBarTitle(title: 'Cart Screen'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: themeProvider.getIsDarkTheme
                    ? AppColors.darkPrimaryColor
                    : AppColors.lightPrimaryColor,
              ))
        ],
      ),
      body: isEmptyOrders
          ? EmptyPageWidget(
              imagePath: AppImagesPath.profileAllOrder,
              title: 'Cart now is empty',
              subTitle:
                  'hbfjgdlfkjgdfjglkfdjgkldfjgldfkjgdlkfjgdklm,.mvx,.cjiogud')
          : ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return OrderWidget();
              },
            ),
    );
  }
}
