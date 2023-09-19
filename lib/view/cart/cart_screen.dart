part of '../../import_path.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  final bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? Scaffold(
            body: EmptyPageWidget(
                imagePath: AppImagesPath.profileAllOrder,
                title: 'Cart now is empty',
                subTitle:
                    'hbfjgdlfkjgdfjglkfdjgkldfjgldfkjgdlkfjgdklm,.mvx,.cjiogud'))
        : Scaffold(
            bottomSheet: BottomCheckout(),
            appBar: AppBar(
              title: const Text('Cart Screen'),
              //Text('Cart Screen'),
              // AppBarTitle(title: 'Cart Screen'),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
            body: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return CartWidget();
              },
            ),
          );
  }
}
